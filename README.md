"# WarthogLabelMap"

Program takes a CSV file and uses info to apply labels to images of the
thrustmaster warthog throttle and stick. Example CSV file is wartysetuped.csv (this was generated from the default Elite Dangerous settings)

Put everything somewhere, load Warty.html into a browser. Use the form button to select the .csv file and then click on the loadfile button. Once loaded the Select Option's will be populated and you can vary the visibility of labels.

The script in the HTML file loads the data from the CSV and creates div's with text labels. The divs have a style applied which matches the styles in the Warty.css file. The Warty.css classes tell the labels where to position themselves with respect to the image.

Label visibility is controlled by select option. Label div Id's are unique with a numbered suffix. Multiple Instances of a label will cause the suffix to increment. It should be possible to use this to group assignments into appropiate pages (with some thought) by conmtrolling the order and using blank labels to push later labels onto a different options page/view. A second csv file PageED.csv shows how this might be done (although something seems broken).


EDControllerSettings.ps1 is a Powershell script which produces an outout that can be used as the basis of the .csv file. Modify the file to point at your bindings file and pipe the output to a .csv file. Remove the first two columns and insert a header row.


