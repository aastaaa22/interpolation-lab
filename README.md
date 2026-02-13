# Interpolation Lab 📊

A comprehensive MATLAB script that demonstrates and compares **6 different interpolation methods** on a stress-strain dataset.

## Overview

This script compares the following interpolation techniques:

1. **Linear Interpolation** - Straight line segments between points
2. **Quadratic Polynomial** - 2nd-degree polynomial fit
3. **Cubic Polynomial** - 3rd-degree polynomial fit
4. **Linear Spline** - Piecewise linear interpolation
5. **Quadratic Spline (makima)** - Modified Akima interpolation
6. **Cubic Spline** - Piecewise cubic with smooth transitions

## Features

✅ **100 data points** of stress vs strain relationship  
✅ **8 visualization figures**:
- Raw data plot
- 6 individual method plots
- 1 comparison plot with all methods

✅ **Results table** showing interpolated values at x=21  
✅ **Fully commented code** for educational purposes  
✅ **No toolbox requirements** - uses only core MATLAB functions  

## Quick Start

### Prerequisites
- MATLAB (R2016b or later) or GNU Octave

### Running the Script

1. **Download or clone this repository**
2. **Open MATLAB/Octave**
3. **Navigate to the script directory**
4. **Run the script:**
   ```matlab
   >> interpolation_lab
   ```

### Output

The script generates:
- **8 figure windows** showing different visualizations
- **Command window table** with interpolated values at x=21

## Code Structure

```
interpolation_lab.m
├── Data Loading & Setup
├── Raw Data Visualization
├── 6 Interpolation Methods
│   ├── Method 1: Linear Interpolation
│   ├── Method 2: Quadratic Polynomial
│   ├── Method 3: Cubic Polynomial
│   ├── Method 4: Linear Spline
│   ├── Method 5: Quadratic Spline (makima)
│   └── Method 6: Cubic Spline
├── Results Table
├── Individual Method Plots
└── Comparison Plot
```

## Methods Comparison

| Method | Speed | Smoothness | Oscillation Risk | Best For |
|--------|-------|-----------|-----------------|----------|
| Linear | ⚡⚡⚡ | ⭐ | None | Quick estimates |
| Quadratic Poly | ⚡⚡⚡ | ⭐⭐ | Low | Mild curves |
| Cubic Poly | ⚡⚡⚡ | ⭐⭐⭐ | **HIGH** | Well-behaved data only |
| Linear Spline | ⚡⚡⚡ | ⭐ | None | Simple interpolation |
| Makima Spline | ⚡⚡ | ⭐⭐⭐ | Low | **Noisy/scattered data** |
| Cubic Spline | ⚡⚡ | ⭐⭐⭐ | Very Low | **General purpose (BEST)** |

## Key Differences Explained

### Linear vs Spline Methods
- **Linear**: Fast but jagged (continuous but not smooth)
- **Splines**: Smoother curves with better visual appearance

### Polynomial Fitting
- **Quadratic**: Good for parabolic data
- **Cubic**: More flexible but can oscillate wildly
- **Splines**: Avoid wild oscillations by using piecewise approach

### Best Practice
For general scientific/engineering applications, **Cubic Spline** is recommended because it balances smoothness, accuracy, and stability.

## Customization

You can easily modify the script:

1. **Change query point:**
   ```matlab
   x_query = 25;  % Instead of 21
   ```

2. **Use different data:**
   Replace the `x` and `y` arrays with your own data

3. **Adjust fine grid resolution:**
   ```matlab
   x_fine = linspace(min(x), max(x), 500);  % More points = smoother curves
   ```

## Technical Notes

- All data points are converted to column vectors for compatibility
- 100 fine grid points are used for smooth curve plotting
- Query point is set to x=21 (middle of dataset range)
- No external toolboxes required

## Troubleshooting

### Error: "Undefined function 'makima'"
- **Solution**: GNU Octave may not have `makima`. Replace with `interp1(x,y,x_fine,'pchip')`

### Figures look strange
- **Solution**: Check that `x` and `y` are column vectors

## License

Open source - Feel free to use and modify for educational purposes

---

**Happy Interpolating! 📈**
