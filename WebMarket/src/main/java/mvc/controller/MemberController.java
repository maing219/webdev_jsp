package mvc.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.model.BoardDTO;
import mvc.model.MemberDAO;
import mvc.model.MemberDTO;

/**
 * Servlet implementation class MemberController
 */
public class MemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	MemberDAO dao = MemberDAO.getInstance();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public MemberController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String requestURI = request.getRequestURI(); // /WebMarket/BoardListAction.do
		String contextPath = request.getContextPath(); // /WebMarket
		String command = requestURI.substring(contextPath.length()); // /BoardListAction.do
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");

		if (command.equals("/MemberListAction.member")) {
			requestMemberList(request);
			RequestDispatcher rd = request.getRequestDispatcher("./member/list.jsp");
			rd.forward(request, response);
		} else if (command.equals("/MemberViewAction.member")) {
			requestMemberView(request);
			RequestDispatcher rd = request.getRequestDispatcher("./member/view.jsp");
			rd.forward(request, response);
		} else if (command.equals("/MemberUpdateAction.member")) {
			requestMemberUpdate(request);
			RequestDispatcher rd = request.getRequestDispatcher("/MemberListAction.member");
			rd.forward(request, response);
		} else if (command.equals("/MemberDeleteAction.member")) {
			requestMemberDelete(request);
			RequestDispatcher rd = request.getRequestDispatcher("/MemberListAction.member");
			rd.forward(request, response);
		}
	}
	
	private void requestMemberDelete(HttpServletRequest request) {
		String id = request.getParameter("id");
		dao.deleteMember(id);
	}
	
	private void requestMemberList(HttpServletRequest request) {
		List<MemberDTO> memberlist = new ArrayList<MemberDTO>();
		memberlist = dao.getMemberList();
		
		request.setAttribute("memberlist", memberlist);
	}

	private void requestMemberView(HttpServletRequest request) {
		String id = request.getParameter("id");
		MemberDTO member = new MemberDTO();
		member = dao.getMemberById(id);

		request.setAttribute("id", id);
		request.setAttribute("member", member);
	}
	
	private void requestMemberUpdate(HttpServletRequest request) {
		String id = request.getParameter("id");
		String birthyy = request.getParameter("birthyy");
		String birthmm = request.getParameter("birthmm");
		String birthdd = request.getParameter("birthdd");
		String mail1 = request.getParameter("mail1");
		String mail2 = request.getParameter("mail2");
		MemberDTO member = new MemberDTO();
		String birth = birthyy + "/" + birthmm + "/" + birthdd;
		String mail = mail1 + "@" + mail2;
		member.setId(id);
		member.setPassword(request.getParameter("password"));
		member.setName(request.getParameter("name"));
		member.setGender(request.getParameter("gender"));
		member.setBirth(birth);
		member.setMail(mail);
		member.setPhone(request.getParameter("phone"));
		member.setAddress(request.getParameter("address"));
	
		dao.updateMember(member);	
	}
}
