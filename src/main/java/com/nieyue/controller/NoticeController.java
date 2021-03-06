package com.nieyue.controller;


import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.nieyue.bean.Notice;
import com.nieyue.exception.NotAnymoreException;
import com.nieyue.exception.NotIsNotExistException;
import com.nieyue.service.NoticeService;
import com.nieyue.util.ResultUtil;
import com.nieyue.util.StateResult;
import com.nieyue.util.StateResultList;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;


/**
 * 通知控制类
 * @author yy
 *
 */
@Api(tags={"notice"},value="通知",description="通知管理")
@RestController
@RequestMapping("/notice")
public class NoticeController {
	@Resource
	private NoticeService noticeService;
	
	/**
	 * 通知分页浏览
	 * @param orderName 商品排序数据库字段
	 * @param orderWay 商品排序方法 asc升序 desc降序
	 * @return
	 */
	@ApiOperation(value = "通知列表", notes = "通知分页浏览")
	@ApiImplicitParams({
	  @ApiImplicitParam(name="region",value="范围，1全局，2个人",dataType="int", paramType = "query"),
	  @ApiImplicitParam(name="title",value="标题",dataType="string", paramType = "query"),
	  @ApiImplicitParam(name="status",value="状态，默认0未读，1已读",dataType="int", paramType = "query"),
	  @ApiImplicitParam(name="accountId",value="账户ID",dataType="int", paramType = "query"),
	  @ApiImplicitParam(name="parentId",value="父ID",dataType="int", paramType = "query"),
	  @ApiImplicitParam(name="pageNum",value="页头数位",dataType="int", paramType = "query",defaultValue="1"),
	  @ApiImplicitParam(name="pageSize",value="每页数目",dataType="int", paramType = "query",defaultValue="10"),
	  @ApiImplicitParam(name="orderName",value="排序字段",dataType="string", paramType = "query",defaultValue="notice_id"),
	  @ApiImplicitParam(name="orderWay",value="排序方式",dataType="string", paramType = "query",defaultValue="desc")
	  })
	@RequestMapping(value = "/list", method = {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody StateResultList browsePagingNotice(
			@RequestParam(value="region",required=false)Integer region,
			@RequestParam(value="title",required=false)String title,
			@RequestParam(value="status",required=false)Integer status,
			@RequestParam(value="accountId",required=false)Integer accountId,
			@RequestParam(value="parentId",required=false)Integer parentId,
			@RequestParam(value="pageNum",defaultValue="1",required=false)int pageNum,
			@RequestParam(value="pageSize",defaultValue="10",required=false) int pageSize,
			@RequestParam(value="orderName",required=false,defaultValue="notice_id") String orderName,
			@RequestParam(value="orderWay",required=false,defaultValue="desc") String orderWay)  {
			List<Notice> list = new ArrayList<Notice>();
			list= noticeService.browsePagingNotice(region,title,status,accountId,parentId,pageNum, pageSize, orderName, orderWay);
			if(list.size()>0){
				return ResultUtil.getSlefSRSuccessList(list);
				
			}else{
				throw new NotAnymoreException();//没有更多
			}
	}
	/**
	 * 通知修改
	 * @return
	 */
	@ApiOperation(value = "通知修改", notes = "通知修改")
	@RequestMapping(value = "/update", method = {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody StateResult updateNotice(@ModelAttribute Notice notice,HttpSession session)  {
		boolean um = noticeService.updateNotice(notice);
		return ResultUtil.getSR(um);
	}
	/**
	 * 通知增加
	 * @return 
	 */
	@ApiOperation(value = "通知增加", notes = "通知增加")
	@RequestMapping(value = "/add", method = {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody StateResult addNotice(@ModelAttribute Notice notice, HttpSession session) {
		boolean am = noticeService.addNotice(notice);
		return ResultUtil.getSR(am);
	}
	/**
	 * 通知删除
	 * @return
	 */
	@ApiOperation(value = "通知删除", notes = "通知删除")
	@ApiImplicitParams({
		  @ApiImplicitParam(name="noticeId",value="通知ID",dataType="int", paramType = "query",required=true)
		  })
	@RequestMapping(value = "/delete", method = {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody StateResult delNotice(@RequestParam("noticeId") Integer noticeId,HttpSession session)  {
		boolean dm = noticeService.delNotice(noticeId);
		return ResultUtil.getSR(dm);
	}
	/**
	 * 通知浏览数量
	 * @return
	 */
	@ApiOperation(value = "通知数量", notes = "通知数量查询")
	@ApiImplicitParams({
		@ApiImplicitParam(name="region",value="范围，1全局，2个人",dataType="int", paramType = "query"),
		  @ApiImplicitParam(name="title",value="标题",dataType="string", paramType = "query"),
		  @ApiImplicitParam(name="status",value="状态，默认0未读，1已读",dataType="int", paramType = "query"),
		  @ApiImplicitParam(name="accountId",value="通知人id",dataType="int", paramType = "query"),
		  @ApiImplicitParam(name="parentId",value="父id",dataType="int", paramType = "query")
		  })
	@RequestMapping(value = "/count", method = {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody int countAll(
			@RequestParam(value="region",required=false)Integer region,
			@RequestParam(value="title",required=false)String title,
			@RequestParam(value="status",required=false)Integer status,
			@RequestParam(value="accountId",required=false)Integer accountId,
			@RequestParam(value="parentId",required=false)Integer parentId,
			HttpSession session)  {
		int count = noticeService.countAll(region,title,status,accountId,parentId);
		return count;
	}
	/**
	 * 通知单个加载
	 * @return
	 */
	@ApiOperation(value = "通知单个加载", notes = "通知单个加载")
	@ApiImplicitParams({
		  @ApiImplicitParam(name="noticeId",value="通知ID",dataType="int", paramType = "path",required=true)
		  })
	@RequestMapping(value = "/{noticeId}", method = {RequestMethod.GET,RequestMethod.POST})
	public  StateResultList loadNotice(@PathVariable("noticeId") Integer noticeId,HttpSession session)  {
		List<Notice> list = new ArrayList<Notice>();
		Notice	notice = noticeService.loadNotice(noticeId);
			if(notice!=null &&!notice.equals("")){
				notice.setStatus(1);//已读
				boolean b=noticeService.updateNotice(notice);
				if(b){
					list.add(notice);
				}
				return ResultUtil.getSlefSRSuccessList(list);
			}else{
				throw new NotIsNotExistException("通知");//不存在
			}
	}
	
}
