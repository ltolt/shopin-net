package org.easyexplore.preferences;

import org.eclipse.jface.preference.*;
import org.eclipse.ui.IWorkbenchPreferencePage;
import org.eclipse.ui.IWorkbench;
import org.easyexplore.EasyExplorePlugin;
import org.eclipse.jface.preference.IPreferenceStore;

/**
 * Preference for program used by Easy Explore
 */

public class EasyExplorePreferencePage
	extends FieldEditorPreferencePage
	implements IWorkbenchPreferencePage {
	public static final String P_TARGET = "targetPreference";

	public EasyExplorePreferencePage() {
		super(GRID);
		setPreferenceStore(EasyExplorePlugin.getDefault().getPreferenceStore());
		setDescription("Set up your file explorer application.");
		initializeDefaults();
	}
/**
 * Sets the default values of the preferences.
 */
	private void initializeDefaults() {
		IPreferenceStore store = getPreferenceStore();
		store.setDefault(P_TARGET, "explorer.exe {0}");
	}
	
/**
 * Creates the field editors. Field editors are abstractions of
 * the common GUI blocks needed to manipulate various types
 * of preferences. Each field editor knows how to save and
 * restore itself.
 */

	public void createFieldEditors() {

		addField(
			new StringFieldEditor(P_TARGET, "&Target:", getFieldEditorParent()));

	}
	
	public void init(IWorkbench workbench) {
	}
}