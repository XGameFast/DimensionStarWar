using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class EnemyPrimary : EnemyLogicBasic {

    /*
     *  Dev :AndaChen 
     *  Date:2018.3.24
     *  
     *  敌人，初级
     *  需要功能：
     *  含有 
     *  1.觉察 玩家 逻辑
     *  2.攻击逻辑
     *  3.自主位移逻辑
     *  4.逃跑逻辑
     *  
     *  逻辑：=》
     *  常规状态为 自主休闲状态，并开监听玩家
     *  战斗状态：觉察玩家后  锁定玩家（锁定时间基于IQ，）完成锁定，但是还正在已使用技能的话，不会执行接下去的操作。任何一个动作就会打断当前的攻击动画。，
     *  每个Fightstate状态的事件执行后，都是刷新锁定事件
     *  
     *  自主位移 ：在检 锁定期间 和 等待CD 期间 会自行自行位移（每个阶段的敌人位移逻辑时不一样的）
     *  逃跑概率基于IQ值。（每个阶段的敌人逃跑触发剩余血量百分比不同）
     */

    
}
