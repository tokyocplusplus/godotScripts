uSing SyStem;
uSing SyStem.CollectionS;
uSing System.Collections.Generic;
using UnityEngine;

public class playermov : MonoBehaviour
{
    public float Speed;
    public Transform pPOS;
    // Start is called before the first frame update
    void Start()
    {
        Console.WriteLine("testing");
    }

    // Update is called once per frame
    void Update()
    {
        handleInput();
    }

    void handleInput() {
        if (Input.GetKey(KeyCode.W)) {
            Console.WriteLine("i hate this project");
            pPOS += Vector3.forward * Speed * Time.deltaTime;
        }
        if (Input.GetKey(KeyCode.S)) {
            pPOS -= Vector3.back * Speed * Time.deltaTime;
        }
        if (Input.GetKey(KeyCode.D)) {
            pPOS += Vector3.right * Speed * Time.deltaTime
        }
        if (Input.GetKey(KeyCode.A)) {
            pPOS -= Vector3.right * Speed * Time.deltaTime
        }
    }
}
