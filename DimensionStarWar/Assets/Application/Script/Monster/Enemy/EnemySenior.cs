using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class EnemySenior : EnemyLogicBasic
{
    /*
     *  Dev :AndaChen 
     *  Date:2018.3.24
     *  
     *  敌人，高级
     *  需要功能：
     *  含有 
     *  1.觉察 玩家 逻辑
     *  2.锁定玩家逻辑 
     *  3.自主位移逻辑
     *  
     *  4.攻击逻辑
     *  
     *  
     *  逻辑：=》
     *  常规状态为 自主休闲状态，并开监听玩家
     *  战斗状态：觉察玩家后  锁定玩家（锁定时间基于IQ，）
     *  【1】锁定完成 : 判断是否正在播放攻击动画，如有，return，没有 执行攻击
     *  【2】锁定为完成：随机 （1）移动， （2）待机，
     *  { 待机拥有 躲避检测 ，检测玩家技能 能够击中自己的时候，有概率触发反击 }
     *  
     * 根据玩家的当前技能的cd。+0.5，来反复触发躲避。
     *  
     *   
     *
     *
     */
     
}
