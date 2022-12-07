integer anims;
integer listener;
default
{
    state_entry()
    {
        anims = llGetInventoryNumber(INVENTORY_ANIMATION);
        llSetText("I have found " + (string)anims + " animations",<1,1,1>,1);
        llSetText("Please Touch the installer for stage 1!",<1,1,1>,1);
        listener = llListen(-155,"",NULL_KEY,"start");
    }
    listen(integer chan,string name,key id,string msg)
    {
        llSetText("transfer in progress",<1,1,1>,1);
        integer x;
        while(x<=anims)
        {
            if(llGetInventoryName(INVENTORY_ANIMATION,x) != "")
            llGiveInventory(id,llGetInventoryName(INVENTORY_ANIMATION,x));
            ++x;
        } 
        llSetText("Finished",<1,1,1>,1);
        llSleep(2);
        llRemoveInventory(llGetScriptName());
        llSetText("",<1,1,1>,1);
    }
}
