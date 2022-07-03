% Simon Chong Kai Yuen
% A19EC3028

% Alternative Assessment of Multimedia Data Processing
% Image to sound Conversion
% Session 2021/2022 Semester 2

function convert(img_name)
    image_name = ("images/" + img_name);
    img = imread(image_name);
    [row, column] = size(img);

    % get the total pixel in the image
    image_total_pixel = row*column;
    % calculate the digit number in total pixel
    total_digit = numel(num2str(image_total_pixel));
    % get 1 digit less to divide in next step
    division = 10^(total_digit - 1);
    % get 1 digit for the duration of the sound
    duration = ceil(image_total_pixel / division);

    % Extract the individual RGB color channel.
    red_channel = img(:, :, 1);
    green_channel = img(:, :, 2);
    blue_channel = img(:, :, 3);

    % Get means of each color channel from the entire image
    mean_R = mean(red_channel(:));
    mean_G = mean(green_channel(:));
    mean_B = mean(blue_channel(:));

    avg_duration = duration/3;

    freq = [mean_R, mean_G, mean_B];
    tones = 0;
    for i=1:3
        tones = tones + (note(freq(i), avg_duration, 16000));
    end

    soundsc(tones) %sample rate

    subplot(1,2,1),imshow(img);
    subplot(1,2,2),plot(tones);