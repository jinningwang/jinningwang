# Experience from EV model developing

The co-simulation is slow, so I tried to accelerate it.
After tested, EV model consumed lot of time.

Two suspects: ``apply`` and ``index``.
