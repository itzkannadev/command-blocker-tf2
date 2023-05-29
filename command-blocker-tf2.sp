#include <sourcemod>

public Action:ClientConnect(int client)
{
    if (g_pConfigFile != INVALID_HANDLE)
    {
        new String:configValue[32];
        GetConfigString(g_pConfigFile, "cl_disablehtmlmotd", configValue, sizeof(configValue));

        if (StrEqual(configValue, "1"))
        {
            KickClient(client, "You are not allowed to disable HTML MOTD.");
            return Plugin_Handled;
        }
    }

    return Plugin_Continue;
}

public void OnPluginEnd()
{
    if (g_pConfigFile != INVALID_HANDLE)
    {
        CloseConfigFile(g_pConfigFile);
    }
}
