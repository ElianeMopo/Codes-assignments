 close all; clc;

A = imread('fruit_basket.jpg');
image(A)
X = double(rgb2gray(A));
imagesc(X), axis off, colormap gray
title('Original fruit basket')
[U,S,V] = svd(X, 'econ');

% Display the approximated images in a 3by2 subplot for the six different truncation values.

r_set = [5 10 40 100 200 250]; 
figure;
for i = 1:length(r_set)
    r = r_set(i);
    Xapprox = U(:,1:r) * S(1:r,1:r) * V(:,1:r)';
    subplot(3, 2, i); 
    imagesc(Xapprox), axis off, colormap gray;
    title(['r = ', num2str(r)]);
end
 
% Calculate and visualize the percentage of the original image variation accounted by each of the singular values

proportion_of_variation = diag(S) / sum(diag(S));

Cumulative_sum = cumsum(proportion_of_variation);

figure;
plot(1:length(diag(S)), Cumulative_sum, 'o-', 'MarkerIndices', [5 10 40 100 200 250]);
ylabel('Cumulative energy');
xlabel('r');
axis tight;

%For r = 250, the reconstructed image is very accurate, and the singular
% values account for about 98% of the image variance.
