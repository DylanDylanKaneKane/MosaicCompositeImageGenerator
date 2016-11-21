function createBagOfFeatures = bag_of_features(image, image_directory, test_image_directory)

test_bag_of_features = bagOfFeatures(test_image_directory);
bag_of_features = bagOfFeatures(image_directory);

testFeatureVector = encode(test_bag_of_features, test_image_directory);
featureVector = encode(bag_of_features, image);

[labelIdx, score] = predict(categoryClassifier, image);

labelIdx
end