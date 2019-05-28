using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;


public class StatusUIController : MonoBehaviour
{
    private Text statusText;

    public bool unityIsRunning;
    public bool vrepIsRunning;
    public bool rosIsRunning;

    private string unityStatus;
    private string vrepStatus;
    private string rosStatus;
    private string rosSocketAdr;

    void Awake()
    {
        statusText = gameObject.GetComponent<Text>();

        unityIsRunning = true;
        // TODO Check if the following are running
        vrepIsRunning = false;
        rosIsRunning = false;
    }

    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        rosIsRunning = GameObject.Find("ROSConnection").GetComponent<ROSConnection>().IsRosSocketAlive();


        // <color="#323232">Status</color>
        // Unity is <color="#00ff00ff">RUNNING</color>
        // V-REP is <color="#ff0000ff">NOT RUNNING</color>
        // ROS is <color="#ff0000ff">NOT RUNNING</color>
        // <color="#ff0000ff">(ws://localhost:9090)</color>

        string running = "<color=\"#00ff00ff\">RUNNING</color>";
        string notRunning = "<color=\"#ff0000ff\">NOT RUNNING</color>";

        unityStatus = unityIsRunning ? running : notRunning;
        vrepStatus = vrepIsRunning ? running : notRunning;
        rosStatus = rosIsRunning ? running : notRunning;
        rosSocketAdr = rosIsRunning ? "<color=\"#00ff00ff\">(ws://localhost:9090)</color>"
            : "<color=\"#ff0000ff\">(ws://localhost:9090)</color>";

        statusText.text = string.Format(
            "Status" + Environment.NewLine +
            "Unity is {0}" + Environment.NewLine +
            "V-REP is {1}" + Environment.NewLine +
            "ROS is {2}" + Environment.NewLine +
            "{3}",
            unityStatus,
            vrepStatus,
            rosStatus,
            rosSocketAdr
        );
    }
}
