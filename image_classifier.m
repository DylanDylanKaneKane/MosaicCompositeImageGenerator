function image_classifier()

setTestDir = fullfile('Image','training');
setNaturalDir = fullfile('Image', 'training', 'natural');
setManmadeDir = fullfile('Image', 'training', 'manmade');
imds = imageDataStore(image_directory, 'includeSubfolders', true, 'LabelSource', 'foldernames');
testimds = imageDataStore(setTestDir, 'includeSubfolders', true, 'LabelSource', 'foldernames');
naturalimds = imageDataStore(setNaturalDir, includeSubfolders', true, 'LabelSource', 'foldernames');
manmadeimds = imageDataStore(setManmadeDir, includeSubfolders', true, 'LabelSource', 'foldernames');
trainingSet = testimds;
testSet = imds;
naturalSet = naturalimds;
manmadeSet = manmadeimds;
testbag = bagOfFeatures(trainingSet);
bag = bagOfFeatures(testSet);
naturalbag = bagOfFeatures(naturalSet);
manmadebag = bagOfFeatures(manmadeSet);
categoryClassifier = trainImageCategoryClassifier(trainingSet, testbag);
manmadeCategoryClassifier = trainImageCategoryClassifier(manmadeSet, manmadebag);
naturalCategoryClassifier = trainImageCategoryClassifier(naturalSet, naturalbag);
naturalconfidence = evaluate(naturalCategoryClassifier, bag); 
naturalconfidencemean = mean(diag(naturalconfidence));
manmadeconfidence = evaluate(manmadeCategoryClassifier, bag);
manmadeconfidencemean = mean(diag(manmadeconfidence));
categoryClassifier.Labels(labelIdx);

if (naturalconfidencemean > manmadeconfidencemean)
    is_natural = true;
else
    is_natural = false;
end 
    is_natural
    
end
