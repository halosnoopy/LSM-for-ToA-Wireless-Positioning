# The Least Squares Method for Trilateration Algorithm Based on ToA Ranging

---

## Overview
This project demonstrates the use of the Least Squares Method (LSM) to estimate positions in a Time-of-Arrival (ToA) based trilateration system for wireless positioning.  
The simulation models a 3D environment and evaluates the positioning accuracy of LSM under both ideal and noisy conditions.

---

## Background
In outdoor environments, GPS provides high-accuracy positioning. However, GPS signals weaken indoors, reducing accuracy.  
To address this, indoor positioning technologies such as UWB, RFID, Bluetooth, WiFi, and 5G have been developed.  
Among these, ToA-based trilateration estimates user positions by calculating distances from known reference points.

To improve computational efficiency, this project applies the Least Squares Method to solve the trilateration equations numerically.

---

## Methodology

1. **Trilateration Setup**  
   Four base stations (BS1–BS4) are placed at the corners of a 3D space (10 m × 10 m × 10 m).  
   A virtual user position is randomly generated.

2. **Distance Estimation**  
   The distances from the user to each base station are calculated using ToA measurements.

3. **Least Squares Estimation**  
   The LSM algorithm computes the user’s coordinates by minimizing the squared error between measured and estimated distances.

4. **Performance Evaluation**  
   Positioning accuracy is analyzed under ideal conditions and with added White Gaussian Noise.

---

## File Descriptions

| File | Description |
|------|--------------|
| `simulation.m` | Generates a 3D environment with four base stations and a random user point. Computes distances using ToA and visualizes the scene. |
| `LS.m` | Implements the Least Squares algorithm to estimate the user’s position based on distance measurements. |
| `auto_run.m` | Automates the simulation and positioning process for multiple iterations (e.g., 100 runs). Displays estimated positions and errors. |
| `RMSE_noise.m` | Evaluates the effect of White Gaussian Noise on positioning accuracy. Computes and plots RMSE versus noise standard deviation. |




