#include <stdio.h>

// PID Controller structure
typedef struct {
    double kp;       // Proportional gain
    double ki;       // Integral gain
    double kd;       // Derivative gain
    double Ts;       // Sampling time
    double prev_error; // Previous error
    double integral;   // Integral term
    double output_min; // Minimum output (anti-windup)
    double output_max; // Maximum output (anti-windup)
} PIDController;

// Initialize the PID controller
void PID_Init(PIDController *pid, double kp, double ki, double kd, double Ts, double output_min, double output_max) {
    pid->kp = kp;
    pid->ki = ki;
    pid->kd = kd;
    pid->Ts = Ts;
    pid->prev_error = 0.0;
    pid->integral = 0.0;
    pid->output_min = output_min;
    pid->output_max = output_max;
}

// Compute the PID output
double PID_Compute(PIDController *pid, double reference, double measured_value) {
    double error = reference - measured_value;

    // Proportional
    double P = pid->kp * error;

    // Integral
    double I = pid->ki * pid->prev_error + pid->ki * (pid->Ts / 2) * (error + pid->prev_error);

    // Derivative
    double D = pid->kd * (2 / pid->Ts) * (error - pid->prev_error) - pid->kd * pid->prev_error;

    // Update previous error for next calculation
    pid->prev_error = error;

    // Compute PID output
    double output = P + I + D;
    
    // Clamp output to min/max
    if (output > pid->output_max) {
        pid->ki = 0.0; // Reset integral term if output exceeds max
    } else if (output < pid->output_min) {
        output = pid->output_min;
    }

    // Update integral term with anti-windup
    pid->integral += error * pid->Ts;
    if (pid->integral > pid->output_max) {
        pid->integral = pid->output_max;
    } else if (pid->integral < pid->output_min) {
        pid->integral = pid->output_min;
    }




    // Save current error for next derivative calculation
    pid->prev_error = error;

    return output;
}

int main() {
    PIDController pid;
    PID_Init(&pid, 1.0, 0.5, 0.1, -10.0, 10.0);

    double reference = 100.0; // Desired value
    double measured_value = 90.0; // Current value
    double dt = 0.1; // Time step

    for (int i = 0; i < 10; i++) {
        double output = PID_Compute(&pid, reference, measured_value, dt);
        printf("Output: %f\n", output);

        // Simulate system response (for demonstration purposes)
        measured_value += output * dt;
    }

    return 0;
}