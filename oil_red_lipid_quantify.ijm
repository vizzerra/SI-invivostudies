macro "Oil_red_quantify_particles [3]"

{
	title = getTitle();
	filename_clean = File.nameWithoutExtension();
	path_to_dir = "/Users/Vizzerra/Documents/Warfel Lab/IHC_Quantification";
	path_to_save = "/Users/Vizzerra/Documents/Warfel Lab/";
	
	title = getTitle();
	filename_clean = File.nameWithoutExtension();
	path_to_dir = "/Users/Vizzerra/Documents/Warfel Lab/IHC_Quantification";
	path_to_save = "/Users/Vizzerra/Documents/Warfel Lab/";
	
	run("Colour Deconvolution", "vectors=RGB");
	selectWindow(title+"-(Colour_1)");
	run("Threshold...");
	setAutoThreshold("Huang dark");
	setThreshold(0, 39);
	setOption("BlackBackground", true);
	run("Convert to Mask");
	run("Close");
	run("Set Scale...", "distance=291.0017 known=50 unit=microns");
	run("Analyze Particles...", "size=0.89-Infinity show=Outlines display clear");
	selectWindow(title+"-(Colour_1)");
	run("Measure");
}