macro "CC3_DAB_quantify [1]"

{
	title = getTitle();
	filename_clean = File.nameWithoutExtension();
	path_to_dir = "/Users/Vizzerra/Documents/Warfel Lab/IHC_Quantification";
	path_to_save = "/Users/Vizzerra/Documents/Warfel Lab/";
	
	run("Colour Deconvolution", "vectors=[H DAB]");
	selectWindow(title+"-(Colour_3)");
	close();
	selectWindow(title+"-(Colour_2)");
	run("Threshold...");
	setThreshold(0, 30);
	setOption("BlackBackground", true);
	run("Convert to Mask");
	run("Close");
	run("Set Measurements...", "area mean display redirect=None decimal=3");
	run("Measure");
}