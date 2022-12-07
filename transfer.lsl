integer anims;

default
{
    on_rez(integer n)
    {
        llResetScript();
    }
    state_entry()
    {
        //if(anims)
        //state stage1;
        llSetText("Please insert script installer_1 into the source object now!",<1,1,1>,1);
    }

    touch_start(integer total_number)
    {
        //llAllowInventoryDrop(TRUE);
        llSay(-155, "start");
        state stage1;
    }
}
state stage1
{
    changed(integer c)
    {
        if(c & CHANGED_INVENTORY)
        {
            anims = llGetInventoryNumber(INVENTORY_ANIMATION);
            llSetText("I have found " + (string)anims + " animations \n 
            When finished counting drop installer_2 into the target \n and touch me again!",<1,1,0>,1);
        }
    }
    touch_start(integer total_number)
    {
        llSay(-155, "trans");
        state stage2;
    }
}
state stage2
{
    state_entry()
    {
        llListen(-156,"",NULL_KEY,"");
    }
    listen(integer chan,string name,key id,string msg)
    {
        if(msg == "mykey")
        {
            llSetText("transfer in progress",<1,1,1>,1);
            llSay(-156,"mykey");
        }
        llSetText("transfer in progress",<1,1,1>,1);
        integer x;
        while(x<=anims)
        {
            if(llGetInventoryName(INVENTORY_ANIMATION,x) != "")
            llGiveInventory(id,llGetInventoryName(INVENTORY_ANIMATION,x));
            ++x;
        }
        llGiveInventory(id,"avpose");
        llSetText("Finished",<1,1,1>,1);
        llSleep(2);
        llSay(-155,"end");
        llSetText("Congratulations!!!",<0,1,0>,1);
        llSleep(5);
        llResetScript();
        
    }
}
