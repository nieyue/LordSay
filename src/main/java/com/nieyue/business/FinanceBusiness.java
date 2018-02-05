package com.nieyue.business;


import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.annotation.Configuration;

import com.nieyue.bean.Account;
import com.nieyue.bean.AccountLevel;
import com.nieyue.bean.AccountParent;
import com.nieyue.bean.Distribute;
import com.nieyue.bean.Finance;
import com.nieyue.bean.FinanceRecord;
import com.nieyue.bean.Notice;
import com.nieyue.bean.TeamPurchaseInfo;
import com.nieyue.bean.Vip;
import com.nieyue.bean.VipGrowthRecord;
import com.nieyue.bean.VipNumber;
import com.nieyue.service.AccountLevelService;
import com.nieyue.service.AccountParentService;
import com.nieyue.service.AccountService;
import com.nieyue.service.DistributeService;
import com.nieyue.service.FinanceRecordService;
import com.nieyue.service.FinanceService;
import com.nieyue.service.NoticeService;
import com.nieyue.service.TeamPurchaseInfoService;
import com.nieyue.service.VideoSetService;
import com.nieyue.service.VipGrowthRecordService;
import com.nieyue.service.VipNumberService;
import com.nieyue.service.VipService;
import com.nieyue.util.DateUtil;

/**
 * 财务业务
 */
@Configuration
public class FinanceBusiness {
	@Resource
	VideoSetService videoSetService;
	@Resource
	AccountService accountService;
	@Resource
	AccountLevelService accountLevelService;
	@Resource
	AccountParentService accountParentService;
	@Resource
	FinanceService financeService;
	@Resource
	FinanceRecordService financeRecordService;
	@Resource
	TeamPurchaseInfoService teamPurchaseInfoService;
	@Resource
	VipNumberService vipNumberService;
	@Resource
	VipService vipService;
	@Resource
	VipGrowthRecordService vipGrowthRecordService;
	@Resource
	DistributeService distributeService;
	@Resource
	NoticeService noticeService;
	@Resource
	NoticeBusiness noticeBusiness;
	/**
	 *  根据订单类型，支付方式、账户id、金额，财务业务执行
	 *  （余额支付，首先执行财务业务，再执行订单与订单详情）
	 *  （第三方支付，首先执行请求第三方接口返回给app的统一下单结果，再执行财务业务，最后订单与订单详情）
	 * @param type 类型，1VIP购买，2团购卡团购，3付费课程
	 * @param payType 支付类型，默认1支付宝支付，2微信支付，3余额支付,4ios内购支付
	 * @param accountId 账户id
	 * @param money 金额
	 * @return -1不成功 ，0脱离事物，部分执行，1.成功
	 */
	public int financeExcute(
			Integer type,
			Integer payType,
			Integer accountId,
			Double money
			){
		boolean b=true;//默认true
			/**
			 * vip购买
			 */
			if(type==1){
				int r = financeExcuteVIP( type,payType,accountId,money);
				return r;
			/**
			 * 团购卡团购
			 */
			}else if(type==2){
				
			
			/**
			 * 付费课程购买	
			 */
			}else if(type==3){
				//获取当前人的财务信息
				List<Finance> fl = financeService.browsePagingFinance(null, accountId, 1, 1, "finance_id", "asc");
				Finance f = fl.get(0);
				//余额支付，修改财务表
				if(payType==3){
					//如果价格小于0 或者 余额小于订单价格，返回失败
					if(money<=0 || (f.getMoney()<money)){
						return -1;
					}
					//自身财务
					f.setMoney(f.getMoney()-money);//余额=原来的-花掉的
					f.setConsume(money);//消费余额
					b=financeService.updateFinance(f);
				}
				if(b){
					//自身财务记录
					FinanceRecord fr=new FinanceRecord();
					fr.setAccountId(accountId);//账户id
					fr.setMethod(payType);//支付方式
					fr.setType(11);//付费课程购买
					String transactionNumber=((int) (Math.random()*9000)+1000)+DateUtil.getOrdersTime()+((int)(Math.random()*9000)+10000);
					fr.setTransactionNumber(transactionNumber);//交易单号
					fr.setStatus(2);//1是待处理，2成功，3已拒绝
					fr.setMoney(money);
					b=financeRecordService.addFinanceRecord(fr);
					if(b){
						return 1;
					}
				}
				
			}
		return -1;
	}
	/**
	 *  vip购买财务业务执行
	 * @param type 类型，1VIP购买，2团购卡团购，3付费课程
	 * @param payType 支付类型，默认1支付宝支付，2微信支付，3余额支付,4ios内购支付
	 * @param accountId 账户id
	 * @param money 金额
	 * @return -1不成功 ，0脱离事物，部分执行，1.成功
	 */
	public int financeExcuteVIP(
			Integer type,
			Integer payType,
			Integer accountId,
			Double money
			){
		boolean b=true;//默认true
		//获取当前人的财务信息
		List<Finance> fl = financeService.browsePagingFinance(null, accountId, 1, 1, "finance_id", "asc");
			Finance f = fl.get(0);
		//账户上级表
		List<AccountParent> apl = accountParentService.browsePagingAccountParent(null, null, accountId, null, null, null, null, 1, 1, "account_parent_id", "asc");
				AccountParent ap = apl.get(0);
				Integer aprmid = ap.getRealMasterId();//真实上级id
				List<TeamPurchaseInfo> stpil = teamPurchaseInfoService.browsePagingTeamPurchaseInfo(aprmid, null, null, 1, 1, "team_purchase_info_id", "asc");
					//上级团购信息表
					TeamPurchaseInfo stpi = stpil.get(0);
					if(stpi.getTeamPurchaseCardAllowance()<10){//小于10张报警
						b=buzuNotice(aprmid,stpi.getTeamPurchaseCardAllowance());
					}
					//没有团购卡，直接失败，记录次数
					if(stpi.getTeamPurchaseCardAllowance()<1){
						List<VipNumber> vnl = vipNumberService.browsePagingVipNumber(null, accountId, aprmid, null, null, null, 1, 1, "vip_number_id", "desc");
							VipNumber vn = vnl.get(0);
						//相同一天，不能执行
						if(DateUtil.isSameDate(vn.getUpdateDate(), new Date())){
							return -1;
						}
						if(vnl.size()<=0){
							VipNumber vipNumber=new VipNumber();
							vipNumber.setNumber(1);
							vipNumber.setAccountId(accountId);
							vipNumber.setRealMasterId(aprmid);
							vipNumber.setStatus(1);//待处理
							vipNumberService.addVipNumber(vipNumber);
						}else{
							vn.setNumber(vn.getNumber()+1);
							if(vn.getNumber()>=3){
								vn.setStatus(3);//已超次
							}
							vipNumberService.updateVipNumber(vn);
						}
						return 0;//让部分执行
					}
				//升级人的等级	
				AccountLevel al = accountLevelService.loadAccountLevel(ap.getAccountLevelId());
				//升级成功后的等级
				AccountLevel nal = accountLevelService.loadAccountLevel(ap.getAccountLevelId()+1);
				//只有是0级别才能购买
				if(al.getLevel()==0){
					//余额支付，修改财务表
					if(payType==3){
						//如果价格小于0 或者 余额小于订单价格，返回失败
						if(money<=0 || (f.getMoney()<money)){
							return -1;
						}
						//自身财务
						f.setMoney(f.getMoney()-money);//余额=原来的-花掉的
						f.setConsume(money);//消费余额
						b=financeService.updateFinance(f);
					}
					if(b){
						//自身财务记录
						FinanceRecord fr=new FinanceRecord();
						fr.setAccountId(accountId);//账户id
						fr.setMethod(payType);//支付方式
						fr.setType(8);//vip购买
						String transactionNumber=((int) (Math.random()*9000)+1000)+DateUtil.getOrdersTime()+((int)(Math.random()*9000)+10000);
						fr.setTransactionNumber(transactionNumber);//交易单号
						fr.setStatus(2);//1是待处理，2成功，3已拒绝
						fr.setMoney(money);
						b=financeRecordService.addFinanceRecord(fr);
					}
					if(!b){
						return -1;
					}
					//拆分奖励
					Double splitReward = nal.getSplitReward();
					//上级财务
					List<Finance> sfinancel= financeService.browsePagingFinance(null, aprmid, 1, 1, "finance_id", "asc");
					Finance sfinance = sfinancel.get(0);
					sfinance.setMoney(sfinance.getMoney()+splitReward);//余额
					sfinance.setSplitReward(sfinance.getSplitReward()+splitReward);//拆分奖励
					b=financeService.updateFinance(sfinance);
					if(!b){
						return -1;
					}
					//上级财务记录
					FinanceRecord sfr=new FinanceRecord();
					sfr.setAccountId(sfinance.getAccountId());//上级账户id
					sfr.setMethod(payType);//支付方式
					sfr.setType(9);//分发奖励
					String stransactionNumber=((int) (Math.random()*9000)+1000)+DateUtil.getOrdersTime()+((int)(Math.random()*9000)+10000);
					sfr.setTransactionNumber(stransactionNumber);//交易单号
					sfr.setStatus(2);//1是待处理，2成功，3已拒绝
					sfr.setMoney(money);
					b=financeRecordService.addFinanceRecord(sfr);
					if(!b){
						return -1;
					}
					//拆分分上级奖励
					Double splitParentReward = nal.getSplitParentReward();
					//获取上上级别
					List<AccountParent> sapl = accountParentService.browsePagingAccountParent(null, null, aprmid, null, null, null, null, 1, 1, "account_parent_id", "asc");
					if(sapl.size()==1 &&sapl.get(0)!=null){
					AccountParent sap = sapl.get(0);
					Integer saprmid = sap.getRealMasterId();//上级的真实上级id
					if(saprmid!=null){
					//上上级财务
					List<Finance> ssfinancel= financeService.browsePagingFinance(null, saprmid, 1, 1, "finance_id", "asc");
					Finance ssfinance = ssfinancel.get(0);
					ssfinance.setMoney(ssfinance.getMoney()+splitParentReward);//余额
					ssfinance.setSplitParentReward(ssfinance.getSplitParentReward()+splitParentReward);//拆分上级奖励
					b=financeService.updateFinance(ssfinance);
					if(!b){
						return -1;
					}
					//上上级财务记录
					FinanceRecord ssfr=new FinanceRecord();
					ssfr.setAccountId(ssfinance.getAccountId());//上级账户id
					ssfr.setMethod(payType);//支付方式
					ssfr.setType(10);//二级购买vip奖励
					String sstransactionNumber=((int) (Math.random()*9000)+1000)+DateUtil.getOrdersTime()+((int)(Math.random()*9000)+10000);
					ssfr.setTransactionNumber(sstransactionNumber);//交易单号
					ssfr.setStatus(2);//1是待处理，2成功，3已拒绝
					ssfr.setMoney(money);
					b=financeRecordService.addFinanceRecord(ssfr);
					if(!b){
						return -1;
					}
					}
					}
					//创建vip表
					List<Vip> vipl = vipService.browsePagingVip(accountId, 0, null, 1, 1, "vip_id", "asc");
					Vip vip = vipl.get(0);
					vip.setCreateDate(new Date());
					vip.setExpireDate(DateUtil.nextYear(new Date(), 1));//一年
					vip.setLevel(1);
					vip.setName(al.getName());
					vip.setStatus(1);//没到期
					b=vipService.updateVip(vip);
					if(!b){
						return -1;
					}
					//创建vip成长表
					VipGrowthRecord vipGrowthRecord=new VipGrowthRecord();
					vipGrowthRecord.setName(al.getName());
					vipGrowthRecord.setLevel(1);
					vipGrowthRecord.setCreateDate(new Date());
					vipGrowthRecord.setAccountId(accountId);
					vipGrowthRecord.setPrice(money);
					b=vipGrowthRecordService.addVipGrowthRecord(vipGrowthRecord);
					if(!b){
						return -1;
					}
					//分发表创建
					Distribute distribute=new Distribute();
					Account account = accountService.loadAccount(accountId);
					distribute.setRealname(account.getRealname());
					distribute.setNumber(1);
					distribute.setPrice(money);
					distribute.setDistributeDate(new Date());
					distribute.setCreateDate(new Date());
					distribute.setUpdateDate(new Date());
					distribute.setStatus(1);//默认已分发
					distribute.setAccountId(aprmid);//真实上级id
					distribute.setBuyAccountId(accountId);//购买者id
					b=distributeService.addDistribute(distribute);
					if(!b){
						return -1;
					}
					//自身团购信息表建立
					TeamPurchaseInfo teamPurchaseInfo =new TeamPurchaseInfo();
					teamPurchaseInfo.setAccountId(accountId);//账户id
					teamPurchaseInfo.setAlreadyRecommend(0);//已推荐给上级（张）
					teamPurchaseInfo.setAlreadyRecommendPrice(0.0);//已推荐给上级总额
					teamPurchaseInfo.setAlreadyRecommendUpdateDate(new Date());//已推荐给上级更新时间
					teamPurchaseInfo.setAlreadySplit(0);//已拆分（张）
					teamPurchaseInfo.setAlreadySplitPrice(0.0);//已拆分总额
					teamPurchaseInfo.setAlreadySplitUpdateDate(new Date());//已拆分更新时间
					teamPurchaseInfo.setAlreadyTeamPurchase(0);//已团购（张）
					teamPurchaseInfo.setCreateDate(new Date());//创建时间）
					teamPurchaseInfo.setTeamPurchaseCardAllowance(0);//团购卡余量
					teamPurchaseInfo.setTeamPurchaseSuccess(0);//团购成功（张）
					teamPurchaseInfo.setTeamPurchaseSuccessPrice(0.0);//团购成功总额
					teamPurchaseInfo.setTeamPurchaseSuccessUpdateDate(new Date());//团购成功更新时间
					teamPurchaseInfo.setUpdateDate(new Date());//更新时间
					teamPurchaseInfo.setWaitDispose(0);//待处理（张）
					teamPurchaseInfo.setWaitDisposePrice(0.0);//待处理总额
					teamPurchaseInfo.setWaitDisposeUpdateDate(new Date());//待处理更新时间
					b=teamPurchaseInfoService.addTeamPurchaseInfo(teamPurchaseInfo);
					if(!b){
						return -1;
					}
					//上级团购信息表更新
					stpi.setTeamPurchaseCardAllowance(stpi.getTeamPurchaseCardAllowance()-1);//升级vip就减团购卡
					b=teamPurchaseInfoService.updateTeamPurchaseInfo(stpi);
					if(b){
						return 1;
					}
				}
				return -1;
		}
	/**
	 * 团购卡余额不足通知
	 */
	public boolean buzuNotice(Integer accountId,Integer number){
		boolean b=true;
		Notice notice=noticeBusiness.getNoticeByBuzu(accountId, number);
		b=noticeService.addNotice(notice);
		return b;
	}
}
