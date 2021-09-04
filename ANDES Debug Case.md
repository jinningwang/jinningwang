# ANDES Debug Case

## Bug Description

`EventFlag` did not output as expected. It should return 1 but 0 now.

## Debug Procedres:
1. Set the verbosity level to 10 (andes.main.config_logger(stream_level=10).
2. Set the simulation end time to 5 seconds at which I know the event is on.
3. Check the value of `ss.DGPRCT1.ueef`. It stays at 0.
4. Manually call `ss.DGPRCT1.ueef.check()`. It works. This indicates that `check` is not called properly.
5. Since `check()` is a `v_numeric` of EventFlag, which is a VarService, I searched for `v_numeric` to identify `Model.s_update_var`. 
6. Looking at the logic, `s_update_var` had a `continue` statement that prevented the call to `v_numeric`.
