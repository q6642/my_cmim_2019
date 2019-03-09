function [pot_energy, kinetic_energy] = osc_energy (u, v, omega)

pot_energy = (omega^2*u.^2)/2;
kinetic_energy = (v.^2)/2;