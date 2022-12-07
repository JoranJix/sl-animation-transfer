integer anims;
integer listener;
default
{
    state_entry()
    {
        llAllowInventoryDrop(TRUE);
        anims = llGetInventoryNumber(INVENTORY_ANIMATION);
        //llSetText("I have found " + (string)anims + " animations",<1,1,1>,1);
        llSetText("Please Touch the installer for stage 2!",<1,1,1>,1);
        listener = llListen(-155,"",NULL_KEY,"");
    }
    listen(integer chan,string name,key id,string msg)
    {
        llOwnerSay(msg);
        if(msg == "trans")
        {
            llSleep(1);
            llRemoveInventory("avpose");
            llSetText("transfer in progress",<1,1,1>,1);
            llSay(-156,"mykey");
        }
        if(msg == "end")
        {
            
            llSetText("Finished",<1,1,1>,1);
            llSleep(2);
            llSetText("",<1,1,1>,1);
            llRemoveInventory(llGetScriptName());
        }
        
        
    }
}
