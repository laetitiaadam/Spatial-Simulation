Build a coupled ABM and CA model of the African Savannah.

It consists of the following entities:

Agents

• 20 lions that walk around randomly. A lion is visualisedas an orange circle with the size of 3.

• 20 zebras that also walk around randomly. A zebra is visualisedas a grey triangle with the size of 2.

• Every time, when a lions randomly runs into a zebra, it kills the zebra. (check the built-in function “die” in the documentation)

Cells

• The cells of a CA are modelled in the grid {} section, which is placed after the agents (species{}), but before the simulation (experiment{})

• Assign random biomass values between 0 and 10 kg per cell

• Let grass grow:add 0.1 kg each time step (linear growth)

• Visualise the grassland

