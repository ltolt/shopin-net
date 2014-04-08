package org.easyexplore.actions;

import java.io.File;
import java.io.IOException;
import java.text.MessageFormat;

import org.easyexplore.EasyExplorePlugin;
import org.eclipse.core.resources.IFile;
import org.eclipse.core.resources.IResource;
import org.eclipse.core.runtime.IAdaptable;
import org.eclipse.jdt.core.JavaModelException; 
import org.eclipse.jdt.internal.core.JarEntryFile;
import org.eclipse.jdt.internal.core.PackageFragment;
import org.eclipse.jdt.internal.core.JarPackageFragmentRoot;
import org.eclipse.jface.action.IAction;
import org.eclipse.jface.dialogs.MessageDialog;
import org.eclipse.jface.viewers.ISelection;
import org.eclipse.jface.viewers.IStructuredSelection;
import org.eclipse.swt.widgets.Shell;
import org.eclipse.ui.IObjectActionDelegate;
import org.eclipse.ui.IWorkbenchPart;

public class EasyExploreAction implements IObjectActionDelegate {

	private Object selected=null;
	private Class selectedClass=null;
	/**
	 * Constructor for EasyExploreAction.
	 */
	public EasyExploreAction() {
		super();
	}

	/**
	 * @see IObjectActionDelegate#setActivePart(IAction, IWorkbenchPart)
	 */
	public void setActivePart(IAction action, IWorkbenchPart targetPart) {
	}

	/**
	 * @see IActionDelegate#run(IAction)
	 */
	public void run(IAction action) {
		if ( selected == null ) {
			MessageDialog.openInformation(new Shell(),"Easy Explorer","Unable to explore " + selectedClass.getName());
			EasyExplorePlugin.log("Unable to explore " + selectedClass);
			return;
		}
		File directory = null;
		if ( selected instanceof IResource ) {
			directory= new File(((IResource)selected).getLocation().toOSString());
		} else if ( selected instanceof File ) {
			directory= (File) selected;
		} 
		if ( selected instanceof IFile ) {
			directory = directory.getParentFile();
		} 		
		if ( selected instanceof File ) {
			directory = directory.getParentFile();
		} 
		try {
			String target = EasyExplorePlugin.getDefault().getTarget();
			if ( target.indexOf("{0}") == -1 ) {
				target = target.trim() + " {0}";
			}	
			Runtime.getRuntime().exec(MessageFormat.format(target, new String[]{directory.toString()}));
		} catch ( Exception e ) {
			EasyExplorePlugin.log(e);
		}
	}

	/**
	 * @see IActionDelegate#selectionChanged(IAction, ISelection)
	 */
	public void selectionChanged(IAction action, ISelection selection) {
		IAdaptable adaptable = null;
		this.selected = null;
		if ( selection instanceof IStructuredSelection ) {
			adaptable = (IAdaptable) ((IStructuredSelection)selection).getFirstElement();
			this.selectedClass = adaptable.getClass();
			if ( adaptable instanceof IResource ) {
				this.selected = (IResource) adaptable;
			} else if ( adaptable instanceof PackageFragment && ((PackageFragment)adaptable).getPackageFragmentRoot() instanceof JarPackageFragmentRoot ) {
				this.selected = getJarFile(((PackageFragment)adaptable).getPackageFragmentRoot());
			} else if ( adaptable instanceof JarPackageFragmentRoot ) {
				this.selected = getJarFile(adaptable);
			} else {
				this.selected = (IResource) adaptable.getAdapter(IResource.class);
			}
		}
	}

	protected File getJarFile(IAdaptable adaptable) {
		JarPackageFragmentRoot jpfr = (JarPackageFragmentRoot) adaptable;
		File selected =  (File)  jpfr.getPath().makeAbsolute().toFile();
		if ( !((File)selected).exists() ) {
			File projectFile = new File(jpfr.getJavaProject().getProject().getLocation().toOSString());
			selected = new File( projectFile.getParent() + selected.toString() );
		}
		return selected;
	}

}
