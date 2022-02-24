/**
 * Grab audio from the microphone input and draw a circle whose size
 * is determined by how loud the audio input is.
 */

import processing.sound.*;

AudioIn input;
Amplitude loudness;

FFT fft;
int bands = 128;
float smoothingFactor = 0.2;
// Create a vector to store the smoothed spectrum data in
float[] sum = new float[bands];


void setup() {
  size(800, 600);
  background(255);

  colorMode(HSB);
  // Create an Audio input and grab the 1st channel
  input = new AudioIn(this, 0);
  
  smooth(8);
  // Begin capturing the audio input
  input.start();
  // start() activates audio capture so that you can use it as
  // the input to live sound analysis, but it does NOT cause the
  // captured audio to be played back to you. if you also want the
  // microphone input to be played back to you, call
  //    input.play();
  // instead (be careful with your speaker volume, you might produce
  // painful audio feedback. best to first try it out wearing headphones!)

  // Create a new Amplitude analyzer
  loudness = new Amplitude(this);

  // Patch the input to the volume analyzer
  loudness.input(input);

  // Create the FFT analyzer and connect the playing soundfile to it.
  fft = new FFT(this, bands);
  fft.input(input);
}


void draw() {
  background(125, 255, 125);
  noStroke();
  
  // Perform the analysis
  fft.analyze();

  for (int i = 0; i < bands/4; i++) {
    
    sum[i] += (fft.spectrum[i] - sum[i]) * smoothingFactor;
    float r = map(sum[i], 0, 0.2, 4, 600);
    println(i,fft.spectrum[i]);
    
    int step = (width-40)/(bands/4);
    int x = 20+ i*step;
    int y = height/2;
    
    float h = map(sum[i], 0, 0.2,0,360);
    fill(h, 360, 360);
    // We draw a circle whose size is coupled to the audio analysis
    ellipse(x, y, r, r*4);
  }

}
