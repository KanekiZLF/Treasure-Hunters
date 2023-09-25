// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
//Este script funciona de maneira identica ao setTimeout ou setInterval
#region setInterval
function wait() {
/// @function   wait(index, time);
/// @param      {int|string}    index
/// @param      {real}          time
/// @author     Lucas Chasteen <lucas.chasteen@xgasoft.com>
/// @copyright  XGASOFT 2018, All Rights Reserved
 
/*
Sets a timer and waits for it to complete. Returns 'true' or 'false' depending on timer state.
Input time is a value in seconds.
 
Note that 'true' will only be returned for **one step**, after which the timer will restart
automatically.
 
Timer 'index' can be either an integer or a string. All timers are global, so you should not
use the same index twice unless you want to overwrite a previous timer. For this reason, a
unique string is recommended for easy memorability.
 
Example usage:
    if (wait("t_alarm", 300)) {
        //Action
    }
*/
 
//Set script to auto-init at launch
gml_pragma("global", "wait();");
 
//Initialize data structure if no arguments are supplied
if (argument_count == 0) {
    global.ds_wait = -1; /* DO NOT DO THIS MANUALLY OR YOU WILL CREATE A MEMORY LEAK */
    exit;
}
 
//Ensure timer data structure exists
if (!ds_exists(global.ds_wait, ds_type_map)) {
    global.ds_wait = ds_map_create();
}
 
//Ensure timer ID exists
if (!ds_map_exists(global.ds_wait, argument[0])) {
    global.ds_wait[? argument[0]] = 0;
}
 
//Set timer
if (global.ds_wait[? argument[0]] == 0) {
    global.ds_wait[? argument[0]] = argument[1];
} else {
    //Decrement timer
    global.ds_wait[? argument[0]] -= delta_time/1000000;
                
    //Reset timer and return true when complete
    if (global.ds_wait[? argument[0]] <= 0) {
        ds_map_delete(global.ds_wait, argument[0]);
        return true;
    }
}
 
//Disable until time is complete
return false;
}
#endregion