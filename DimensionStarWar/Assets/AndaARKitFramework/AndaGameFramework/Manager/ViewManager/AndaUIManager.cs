using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class AndaUIManager  {

    private static AndaUIManager _instance = null;
    public static AndaUIManager Instance
    {
        get
        {
            if (_instance == null)
            {
                _instance = new AndaUIManager();
            }
            return _instance;
        }
    }
   
     private Transform _canvasRoot = null;
    private int siblingIndex = 2;
    private Transform jIRVISBar ;
    public Canvas canvas { get { return canvasRoot.GetComponent<Canvas>(); } }

    public RectTransform getCanvasRect
    {
        get {return canvasRoot.GetComponent<RectTransform>() ;}
    }
    public Transform canvasRoot
    {
        get 
        {
            if(_canvasRoot == null)
            {
                _canvasRoot = GameObject.Find("ApplicationUI").transform;
            }
            return _canvasRoot;
        }
    }

    private Transform _uicenter =null;
    public Transform uicenter
    {
        get 
        {
            if(_uicenter == null)
            {
                _uicenter = canvasRoot.Find("center").transform;
            }
            return _uicenter;
        }
    }

    private Transform _jirvisRoot = null;
    public Transform jirvisRoot
    {
        get { 
            if(_jirvisRoot == null)
            {
                _jirvisRoot = canvasRoot.Find("jirvis-top-right").transform;
            }
            return _jirvisRoot;
        }
    }

    private Transform _JIRVISEditorRoot = null;
    public Transform jirvisEditorRoot
    {
        get 

        {
            if(_JIRVISEditorRoot == null)
            {
                _JIRVISEditorRoot = canvasRoot.Find("jirvis-top/EditorboardPoint").transform;
            }

            return _JIRVISEditorRoot;
        }
    }

    private Transform _JIRVISMonsterImageDetail = null;
    public Transform jirvisMonsterImageDetail
    {
        get
        {
            if (_JIRVISEditorRoot == null)
            {
                var _gameObject = canvasRoot.Find("jirvis-top/jirvisMonsterImageDetail");
                if (_gameObject == null)
                {
                    _JIRVISMonsterImageDetail = AndaDataManager.Instance.InstantiateMenu<MonsterImageDetail>(ONAME.JirvisMonsterImageDetail).transform;
                    _JIRVISMonsterImageDetail.SetInto(AndaUIManager.Instance.jirvis_top);
                }
                else {
                    _JIRVISMonsterImageDetail = _gameObject.transform;
                }
            }
            return _JIRVISMonsterImageDetail;
        }
    }

    private Transform _jirvis_top = null;
    public Transform jirvis_top
    {
        get 
        {
            if(_jirvis_top == null)
            {
                _jirvis_top = canvasRoot.Find("jirvis-top").transform;
            }

            return _jirvis_top;
        }
    }

    public WaitBoardBar _waitBoard = null;
    public JIRVISContent_QuicklyPayBar jIRVISContent_QuicklyPay;
    public AndaObjectBasic PopMenu2(string menu_name)
    {


        AndaObjectBasic menu = AndaDataManager.Instance.InstantiateMenu(menu_name);
        //siblingIndex = canvasRoot.transform.childCount;
        if (menu_name == ONAME.JirvisBarName)
        {
            jIRVISBar = menu.transform;
            menu.transform.SetUIInto(jirvisRoot);
        }else
        {
            menu.transform.SetUIInto(uicenter.transform);
        }

        //  menu.transform.SetUIInto(canvasRoot.transform);
      /*  if (jirvisEditorRoot != null)
        {
            jirvisEditorRoot.SetSiblingIndex(siblingIndex);
        }

        if (jIRVISBar!=null)
        {
            jirvisRoot.SetSiblingIndex(siblingIndex+1);
        }
*/
      /*  */
        //JIRVIS.Instance.SetBarIndex(siblingIndex+1);

        //JIRVIS.Instance.jIRVISData.getJIRVISBar.transform.SetAsLastSibling();
       //menu.transform.SetSiblingIndex();
        //
        //menu.SetInto(canvasRoot.transform);
        return menu;
    }

    public T PopingMenu2<T>(string menuname)where T:Object
    {
        T menubase = PopMenu2(menuname).GetComponent<T>();
        return menubase;
    }




    public AndaObjectBasic PopMenu(string menu_name)
    {
        if (menu_name == ONAME.MallBar)
        {
            if (mallBar != null) return mallBar;
        }
        AndaObjectBasic menu = AndaDataManager.Instance.InstantiateMenu(menu_name);
        //menu.transform.SetParent(uiroot.transform);
        menu.self.ResetTran();
        return menu;
    }

    public T PopingMenu<T>(string menu_name) where T : Object
    {
        var _menubasic = PopMenu(menu_name).GetComponent<T>();
        if (menu_name == ONAME.MallBar && mallBar == null)
        {
            mallBar = _menubasic as MallBar;
        }
        return _menubasic;
    }
    
    public InfoBar_Label PopInfoBar_Label()
    {
        return PopingMenu<InfoBar_Label>(ONAME.InfoBar_Label_board);
    }
    public InfoBar_Label PopInfoBar_LabelBackground()
    {
        return PopingMenu<InfoBar_Label>(ONAME.InfoBar_Label_background);
    }
    public InfoBar_Slider_Label PopInfoBar_Slider_Label_Circle()
    {
        return PopingMenu<InfoBar_Slider_Label>(ONAME.InfoBar_Slider_Label_Circle);
    }
    public InfoBar_Slider_Label PopInfoBar_Slider_label_Line()
    {
        return PopingMenu<InfoBar_Slider_Label>(ONAME.InfoBar_Slider_Label_Line);
    }


    public InfoBar_Skill_Icon_Label PopSkillInfoBar()
    {
        return PopingMenu<InfoBar_Skill_Icon_Label>(ONAME.InfoBar_Skill_Icon_Label);
    }
    public InfoBar_Stronghold_Icon_board_label PopStrongholdInfoBar()
    {
        return PopingMenu<InfoBar_Stronghold_Icon_board_label>(ONAME.InfoBar_Stronghold_Icon_board_label);
    }

    public InfoBar_Icon_board PopIcon_board()
    {
        return PopingMenu<InfoBar_Icon_board>(ONAME.InfoBar_Icon_Board);
    }

    public InfoBar_Icon_Board_List PopIcon_Board_List()
    {
        return PopingMenu<InfoBar_Icon_Board_List>(ONAME.InfoBar_Icon_Board_List);
    }

    public View_FollowObject PopFollowTargetUI()
    {
        return PopingMenu<View_FollowObject>(ONAME.FollowTargetUI);
    }

    public void OpenWaitBoard(string tips)
    {
        if(_waitBoard == null)
        {
            _waitBoard = PopingMenu2<WaitBoardBar>("WaitBoard");
            _waitBoard.SetTips(tips);
        }
    }

    public void CloseWaitBoard()
    {
        if(_waitBoard != null)
        {
            _waitBoard.CloseWatiBoard();
        }
    }


    public void OpenQuicklyPayBar(Sprite _sp, string _name, string itemDescription, List<int> payPrice, System.Action<int> callback)
    {
        if(jIRVISContent_QuicklyPay == null) jIRVISContent_QuicklyPay = PopingMenu2<JIRVISContent_QuicklyPayBar>("JIRVISContent_QuicklyPayBar");
        jIRVISContent_QuicklyPay.transform.SetUIInto(jirvis_top);//.set(jirvis_top);
        jIRVISContent_QuicklyPay.SetInfo(_sp,_name,itemDescription,payPrice,callback);
    }

    public void OpenQuicklyPayBar(string imgPath,int _shIndex, string _name, string itemDescription, List<int> payPrice, System.Action<int> callback)
    {
        if (jIRVISContent_QuicklyPay == null) jIRVISContent_QuicklyPay = PopingMenu2<JIRVISContent_QuicklyPayBar>("JIRVISContent_QuicklyPayBar");
        jIRVISContent_QuicklyPay.transform.SetUIInto(jirvis_top);//.set(jirvis_top);
        jIRVISContent_QuicklyPay.SetInfo(imgPath, _shIndex,_name, itemDescription, payPrice, callback);
    }

    public void RemoveQuilickPayBar()
    {
        if(jIRVISContent_QuicklyPay!=null)AndaDataManager.Instance.RecieveItem(jIRVISContent_QuicklyPay);
        jIRVISContent_QuicklyPay = null;
    }


    public MallBar mallBar;
}
