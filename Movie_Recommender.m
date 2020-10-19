digitDatasetPath = fullfile('C:\Users\gurus\Desktop\Movie_poster\poster_downloads');
imds = imageDatastore(digitDatasetPath, 'IncludeSubfolders',true,'LabelSource','foldernames');

figure;
perm = randperm(1000,20);
for i = 1:20
    subplot(4,5,i);
    imshow(imds.Files{perm(i)});
end

resized_image_size = 30;

figure;
img = readimage(imds, 100);
img = imresize(img, [resized_image_size, resized_image_size]);
imshow(img);

num_images = 7635;
dataset = zeros(num_images, resized_image_size*resized_image_size*3);
for i = 1:num_images
    img = readimage(imds, i);
    img = imresize(img, [resized_image_size, resized_image_size]);
    
    i
    
    try
        img = reshape(img, [resized_image_size*resized_image_size*3, 1]);
        dataset(i, :) = img;
    catch
        disp('INVALID CATCH');
    end
end
    
autoenc = trainAutoencoder(dataset', 'MaxEpochs', 100);

size(dataset)
encoded_image = encode(autoenc, dataset');
encoded_image = encoded_image';
size(encoded_image)

digitDatasetPath = fullfile('C:\Users\gurus\Desktop\Movie_poster\Validation');
imds_2 = imageDatastore(digitDatasetPath, 'IncludeSubfolders',true,'LabelSource','foldernames');

num_images = 617;
valset = zeros(num_images, resized_image_size*resized_image_size*3);
for i = 1:num_images
    img = readimage(imds_2, i);
    img = imresize(img, [resized_image_size, resized_image_size]);
    
    try
        img = reshape(img, [resized_image_size*resized_image_size*3, 1]);
        valset(i, :) = img;
    catch
        disp('INVALID CATCH');
    end
end

encoded_images_val = encode(autoenc, valset');
encoded_images_val = encoded_images_val';
num_images_val = size(valset);
num_images_val = num_images_val(1);

num_images_train = size(dataset);
num_images_train = num_images_train(1);


errors = zeros(num_images_train, 1);

disp('======================================================================')
selected_val_image = 532;



for i = 1:num_images_train
    errors(i,1) = sum( (encoded_image(i,:) - encoded_images_val(selected_val_image,:)).^2 );
end


figure(1);
title('Input Image');
img = readimage(imds_2, selected_val_image);
imshow(img);


for i = 1:4
    figure(2);
    subplot(2,2,i);
    [x , best_image_index] = min(errors);
    img = readimage(imds, best_image_index);
    imshow(img);
    errors(best_image_index) = max(errors) + 1;
end


