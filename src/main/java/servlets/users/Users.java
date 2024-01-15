package servlets.users;

import com.parking.parkinglot.common.CarDto;
import com.parking.parkinglot.common.UserDto;
import com.parking.parkinglot.ejb.CarsBean;
import com.parking.parkinglot.ejb.InvoiceBean;
import com.parking.parkinglot.ejb.UsersBean;
import jakarta.annotation.security.DeclareRoles;
import jakarta.inject.Inject;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

@WebServlet(name = "Users", value = "/Users")
@DeclareRoles({"READ_USERS","WRITE_USERS"})
@ServletSecurity(value = @HttpConstraint(rolesAllowed = {"READ_USERS"}),
    httpMethodConstraints = {@HttpMethodConstraint(value = "POST",rolesAllowed = {"WRITE_USERS"})})
public class Users extends HttpServlet {

    @Inject
    UsersBean usersBean;
    @Inject
    InvoiceBean invoceBean;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse
            response) throws ServletException, IOException {
        List<UserDto> users=usersBean.findAllUsers();
        request.setAttribute("activePage","Users");
        request.setAttribute("users",users);
        if(!invoceBean.getUserIds().isEmpty()){
            Collection<String> usernames=usersBean.findUsernameByUserIds(invoceBean.getUserIds());
            request.setAttribute("invoices",usernames);


        }
        request.getRequestDispatcher("/WEB-INF/pages/users/users.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response) throws ServletException, IOException {

        String[] userIdsAsString = request.getParameterValues("user_ids");
        if(userIdsAsString!=null)
        {
            List<Long> userIds=new ArrayList<>();
            for(String userIdAsString: userIdsAsString){
              userIds.add(Long.parseLong(userIdAsString));
            }
            invoceBean.getUserIds().addAll(userIds);

        }


        response.sendRedirect(request.getContextPath()+"/Users");
    }
}