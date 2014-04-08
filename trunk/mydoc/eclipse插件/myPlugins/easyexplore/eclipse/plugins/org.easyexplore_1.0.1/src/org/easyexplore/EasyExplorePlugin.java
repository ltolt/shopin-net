package org.easyexplore;

import org.eclipse.ui.plugin.*;
import org.eclipse.core.runtime.*;
import org.eclipse.jface.preference.IPreferenceStore;
import org.easyexplore.preferences.EasyExplorePreferencePage;
import org.eclipse.core.resources.*;

import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.*;

/**
 * The main plugin class to be used in the desktop.
 */
public class EasyExplorePlugin extends AbstractUIPlugin {
	//The shared instance.
	private static EasyExplorePlugin plugin;
	//Resource bundle.
	private ResourceBundle resourceBundle;
	
	/**
	 * The constructor.
	 */
	public EasyExplorePlugin(IPluginDescriptor descriptor) {
		super(descriptor);
		plugin = this;
		try {
			resourceBundle= ResourceBundle.getBundle("org.easyexplore.EasyExplorePluginResources");
		} catch (MissingResourceException x) {
			resourceBundle = null;
		}
	}

	/**
	 * Returns the shared instance.
	 */
	public static EasyExplorePlugin getDefault() {
		return plugin;
	}

	/**
	 * Returns the workspace instance.
	 */
	public static IWorkspace getWorkspace() {
		return ResourcesPlugin.getWorkspace();
	}

	/**
	 * Returns the string from the plugin's resource bundle,
	 * or 'key' if not found.
	 */
	public static String getResourceString(String key) {
		ResourceBundle bundle= EasyExplorePlugin.getDefault().getResourceBundle();
		try {
			return bundle.getString(key);
		} catch (MissingResourceException e) {
			return key;
		}
	}

	/**
	 * Returns the plugin's resource bundle,
	 */
	public ResourceBundle getResourceBundle() {
		return resourceBundle;
	}
	
	static public void log(Object msg) {
		ILog log = EasyExplorePlugin.getDefault().getLog();
		Status status = new Status(IStatus.ERROR, EasyExplorePlugin.getDefault().getDescriptor().getUniqueIdentifier(), IStatus.ERROR, msg + "\n", null);
		log.log(status);
	}
	
	static public void log(Throwable ex) {
		ILog log = EasyExplorePlugin.getDefault().getLog();
		StringWriter stringWriter = new StringWriter();
	    ex.printStackTrace(new PrintWriter(stringWriter));
		String msg = stringWriter.getBuffer().toString();
		Status status = new Status(IStatus.ERROR, EasyExplorePlugin.getDefault().getDescriptor().getUniqueIdentifier(), IStatus.ERROR, msg, null);
		log.log(status);
	}
	/**
	 * @see org.eclipse.ui.plugin.AbstractUIPlugin#initializeDefaultPreferences(org.eclipse.jface.preference.IPreferenceStore)
	 */
	protected void initializeDefaultPreferences(IPreferenceStore store) {
		EasyExplorePreferencePage pref = new EasyExplorePreferencePage();
		store = pref.getPreferenceStore();
		super.initializeDefaultPreferences(store);
	}
	
	/**
	 * Return the target program setted in EasyExplorePreferencePage.	 * @return String	 */
	public String getTarget() {
		return getPreferenceStore().getString(EasyExplorePreferencePage.P_TARGET);
	}
}
