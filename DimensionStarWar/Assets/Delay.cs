using UnityEngine;
using System.Collections;

namespace Seven.Effect
{
	public class Delay : MonoBehaviour {

		public float delayTime = 0.0f;
		public float hideTime = 0.0f;

		Animator animator;
		// Use this for initialization
		void Start () {
			if (hideTime > 0.0) {
				Invoke ("HideFunc", hideTime);
			}

			animator = gameObject.GetComponent<Animator> ();
			if (delayTime > 0) {
				gameObject.SetActive (false);
				gameObject.SetActiveRecursively (false);
				Invoke ("DelayFunc", delayTime);
			} else 
			{
				animator.SetTrigger ("play");
			}
		}

		void DelayFunc()
		{
			gameObject.SetActive (true);
			gameObject.SetActiveRecursively(true);
			Animator animator = gameObject.GetComponent<Animator> ();
			if (animator != null)
			{
				animator.SetTrigger ("play");
			}
		}

		void HideFunc()
		{
			gameObject.SetActive (false);
		}

		public void ShowEffect()
		{
			gameObject.SetActive (false);
			gameObject.SetActiveRecursively(false);
			if (delayTime > 0) {
				gameObject.SetActive (false);
				gameObject.SetActiveRecursively (false);
				Invoke ("DelayFunc", delayTime);
			}
			else 
			{
				animator.SetTrigger ("play");
			}
			if (hideTime > 0.0) {
				Invoke ("HideFunc", hideTime);
			}
		}
	}
}