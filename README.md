# Image_Texture_Laws
A Matlab based image classification tool that identifies regions of similar textures in an image using Laws' Texture Energy Measures.

    % Image_Texture_Laws(image)- Compute texture parameters
    % On input:
    %       im (MxN array): input image
    % On output:
    %       T (M*Nx10 array): texture parameters
    %           each texture parameter is a column vector in T
    % Call:
    %       T = Image_Texture_Laws(im);
    %Here is an example test case:
    %im=imread('C:\Users\Rohit Singh\OneDrive\MSCS\CS6640 Image Processing\Practise\08-30-18_16-31-53-160.jpg');
    %T = Image_Texture_Laws(im)
    %IDX=kmeans(T,4);  %cluster indexes using kmeans to get segmented regions
    %imgSeg=reshape(IDX,492,652); %replace 492,652 with appropriate image size


