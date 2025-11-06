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

---

## Visualization of Simulation Results

The following figures illustrate the simulation process for the ToA-based trilateration using the LSM in MATLAB.

Figure 1  Initialization of the 3D environment with four base stations (BS1–BS4) placed at the corners of a 10 m × 10 m × 10 m space. The green dot represents a randomly generated user point.

<img width="575" height="433" alt="image" src="https://github.com/user-attachments/assets/7b00efda-1485-4f9d-b6b8-f2e29463efd7" />

Figure 2 Visualization of the distance connections between the user and each base station, representing the ToA ranging data used in trilateration.

<img width="563" height="423" alt="image" src="https://github.com/user-attachments/assets/91d3cd69-59a8-4302-9929-fa2468e80b51" />

Figure 3 Final localization result after applying the Least Squares Method. The green dot represents the true user position, and the red diamond represents the estimated position. The small gap between them indicates the estimation error.

<img width="624" height="473" alt="image" src="https://github.com/user-attachments/assets/d88f0173-94f6-4a21-9876-364fef02996a" />




