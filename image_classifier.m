function imageclassifier = image_classifier

setTestDir = fullfile('Image','training');
setDir = fullfile('Image', 'test');
imds = imageDataStore(setDir, 'includeSubfolders', true, 'LabelSource', 'foldernames');
testimds = imageDataStore(setTestDir, 'includeSubfolders', true, 'LabelSource', 'foldernames');
trainingSet = testimds;
testSet = imds;
testbag = bagOfFeatures(trainingSet);
bag = bagOfFeatures(testSet);
categoryClassifier = trainImageCategoryClassifier(trainingSet, testbag);
confidence = evaluate(categoryClassifier, bag); 
end
