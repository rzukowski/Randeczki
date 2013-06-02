<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="szukajprzyjaciol.aspx.cs" Inherits="szukajprzyjaciol" Title="Szukaj" %>
<%@ Register assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.WebControls" tagprefix="asp" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="AjaxControlToolkit" %>




<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <script type="text/jscript" src="Scripts/CountSelected.js"></script>
    <script type="text/javascript">

        $(document).ready(function () {
            $('#' + '<%= divDDL2.ClientID %>').click(function () { 
                return hideUnhide($(this), 'popup');

            });

            $('#' + '<%= divDDL.ClientID %>').click(function () {
                return hideUnhide($(this), 'popSport');

            });

            $('body').click(function () {
               
                hideUnhideBodyClick('#' + '<%= divDDL2.ClientID %>', 'popup');

                hideUnhideBodyClick('#' + '<%= divDDL.ClientID %>', 'popSport');
            });
           
            

        });



        function hideUnhideBodyClick(objectId, popupId) {
            
            if($(objectId).parent().hasClass('nowe')){
                $find(popupId).hidePopup();

                $(objectId).parent().animate({
                    height: "17px",
                }, 150);

                $(objectId).parent().removeClass('nowe').addClass('rozsun');
              

            }

            return false;
        }

        function hideUnhide(object, popupId) {

            if (object.parent().hasClass('rozsun')) {
                object.parent().animate({
                    height: "15px",
                }, 150);
                object.parent().removeClass('rozsun').addClass('nowe');

                $find(popupId).showPopup();

                return false;
            }
            else {
                object.parent().animate({
                    height: "17px",
                }, 150);
                object.parent().removeClass('nowe');
                object.parent().addClass('rozsun');
                $find(popupId).hidePopup();
                return false;


            }



        }
        
        </script>
        <script type="text/jscript" src="Scripts/OnHoverShowOpis.js"></script>

      


    <asp:ScriptManager   
            ID="ScriptManager2"  
            runat="server"  
            >  
        </asp:ScriptManager>  
  
<form class="form-horizontal">
  <div class="span4" style="width:100%;">

      <div class="control-group">
    <p>Wiek od :&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:DropDownList ID="DropDownList2" runat="server" CssClass="span1">
        <asp:ListItem>16</asp:ListItem>
        <asp:ListItem>17</asp:ListItem>
        <asp:ListItem>18</asp:ListItem>
        <asp:ListItem>19</asp:ListItem>
        <asp:ListItem>20</asp:ListItem>
        <asp:ListItem>21</asp:ListItem>
        <asp:ListItem>22</asp:ListItem>
        <asp:ListItem>23</asp:ListItem>
        <asp:ListItem>24</asp:ListItem>
        <asp:ListItem>25</asp:ListItem>
        <asp:ListItem>26</asp:ListItem>
        <asp:ListItem>27</asp:ListItem>
        <asp:ListItem>28</asp:ListItem>
        <asp:ListItem>29</asp:ListItem>
        <asp:ListItem>30</asp:ListItem>
        <asp:ListItem>31</asp:ListItem>
        <asp:ListItem>32</asp:ListItem>
        <asp:ListItem>33</asp:ListItem>
        <asp:ListItem>34</asp:ListItem>
        <asp:ListItem>35</asp:ListItem>
        <asp:ListItem>36</asp:ListItem>
        <asp:ListItem>37</asp:ListItem>
        <asp:ListItem>38</asp:ListItem>
        <asp:ListItem>39</asp:ListItem>
        <asp:ListItem>40</asp:ListItem>
        <asp:ListItem>41</asp:ListItem>
        <asp:ListItem>42</asp:ListItem>
        <asp:ListItem>43</asp:ListItem>
        <asp:ListItem>44</asp:ListItem>
        <asp:ListItem>45</asp:ListItem>
        <asp:ListItem>46</asp:ListItem>
        <asp:ListItem>47</asp:ListItem>
        <asp:ListItem>48</asp:ListItem>
        <asp:ListItem>49</asp:ListItem>
        <asp:ListItem>50</asp:ListItem>
        <asp:ListItem>51</asp:ListItem>
        <asp:ListItem>52</asp:ListItem>
        <asp:ListItem>53</asp:ListItem>
        <asp:ListItem>54</asp:ListItem>
        <asp:ListItem>55</asp:ListItem>
        <asp:ListItem>56</asp:ListItem>
        <asp:ListItem>57</asp:ListItem>
        <asp:ListItem>58</asp:ListItem>
        <asp:ListItem>59</asp:ListItem>
        <asp:ListItem>60</asp:ListItem>
        <asp:ListItem>61</asp:ListItem>
        <asp:ListItem>62</asp:ListItem>
        <asp:ListItem>63</asp:ListItem>
        <asp:ListItem>64</asp:ListItem>
        <asp:ListItem>65</asp:ListItem>
        <asp:ListItem>66</asp:ListItem>
        <asp:ListItem>67</asp:ListItem>
        <asp:ListItem>68</asp:ListItem>
        <asp:ListItem>69</asp:ListItem>
        <asp:ListItem>70</asp:ListItem>
        <asp:ListItem>71</asp:ListItem>
        <asp:ListItem>72</asp:ListItem>
        <asp:ListItem>73</asp:ListItem>
        <asp:ListItem>74</asp:ListItem>
        <asp:ListItem>75</asp:ListItem>
        <asp:ListItem>76</asp:ListItem>
        <asp:ListItem>77</asp:ListItem>
        <asp:ListItem>78</asp:ListItem>
        <asp:ListItem>79</asp:ListItem>
        <asp:ListItem>80</asp:ListItem>
        <asp:ListItem>81</asp:ListItem>
        <asp:ListItem>82</asp:ListItem>
        <asp:ListItem>83</asp:ListItem>
        <asp:ListItem>84</asp:ListItem>
        <asp:ListItem>85</asp:ListItem>
        <asp:ListItem>86</asp:ListItem>
        <asp:ListItem>87</asp:ListItem>
        <asp:ListItem>88</asp:ListItem>
        <asp:ListItem>89</asp:ListItem>
    </asp:DropDownList>
&nbsp;&nbsp;&nbsp;&nbsp; do&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:DropDownList ID="DropDownList3" runat="server"  CssClass="span1">
        <asp:ListItem>16</asp:ListItem>
        <asp:ListItem>17</asp:ListItem>
        <asp:ListItem>18</asp:ListItem>
        <asp:ListItem>19</asp:ListItem>
        <asp:ListItem>20</asp:ListItem>
        <asp:ListItem>21</asp:ListItem>
        <asp:ListItem>22</asp:ListItem>
        <asp:ListItem>23</asp:ListItem>
        <asp:ListItem>24</asp:ListItem>
        <asp:ListItem>25</asp:ListItem>
        <asp:ListItem>26</asp:ListItem>
        <asp:ListItem>27</asp:ListItem>
        <asp:ListItem>28</asp:ListItem>
        <asp:ListItem>29</asp:ListItem>
        <asp:ListItem>30</asp:ListItem>
        <asp:ListItem>31</asp:ListItem>
        <asp:ListItem>32</asp:ListItem>
        <asp:ListItem>33</asp:ListItem>
        <asp:ListItem>34</asp:ListItem>
        <asp:ListItem>35</asp:ListItem>
        <asp:ListItem>36</asp:ListItem>
        <asp:ListItem>37</asp:ListItem>
        <asp:ListItem>38</asp:ListItem>
        <asp:ListItem>39</asp:ListItem>
        <asp:ListItem>40</asp:ListItem>
        <asp:ListItem>41</asp:ListItem>
        <asp:ListItem>42</asp:ListItem>
        <asp:ListItem>43</asp:ListItem>
        <asp:ListItem>44</asp:ListItem>
        <asp:ListItem>45</asp:ListItem>
        <asp:ListItem>46</asp:ListItem>
        <asp:ListItem>47</asp:ListItem>
        <asp:ListItem>48</asp:ListItem>
        <asp:ListItem>49</asp:ListItem>
        <asp:ListItem>50</asp:ListItem>
        <asp:ListItem>51</asp:ListItem>
        <asp:ListItem>52</asp:ListItem>
        <asp:ListItem>53</asp:ListItem>
        <asp:ListItem>54</asp:ListItem>
        <asp:ListItem>55</asp:ListItem>
        <asp:ListItem>56</asp:ListItem>
        <asp:ListItem>57</asp:ListItem>
        <asp:ListItem>58</asp:ListItem>
        <asp:ListItem>59</asp:ListItem>
        <asp:ListItem>60</asp:ListItem>
        <asp:ListItem>61</asp:ListItem>
        <asp:ListItem>62</asp:ListItem>
        <asp:ListItem>63</asp:ListItem>
        <asp:ListItem>64</asp:ListItem>
        <asp:ListItem>65</asp:ListItem>
        <asp:ListItem>66</asp:ListItem>
        <asp:ListItem>67</asp:ListItem>
        <asp:ListItem>68</asp:ListItem>
        <asp:ListItem>69</asp:ListItem>
        <asp:ListItem>70</asp:ListItem>
        <asp:ListItem>71</asp:ListItem>
        <asp:ListItem>72</asp:ListItem>
        <asp:ListItem>73</asp:ListItem>
        <asp:ListItem>74</asp:ListItem>
        <asp:ListItem>75</asp:ListItem>
        <asp:ListItem>76</asp:ListItem>
        <asp:ListItem>77</asp:ListItem>
        <asp:ListItem>78</asp:ListItem>
        <asp:ListItem>79</asp:ListItem>
        <asp:ListItem>80</asp:ListItem>
        <asp:ListItem>81</asp:ListItem>
        <asp:ListItem>82</asp:ListItem>
        <asp:ListItem>83</asp:ListItem>
        <asp:ListItem>84</asp:ListItem>
        <asp:ListItem>85</asp:ListItem>
        <asp:ListItem>86</asp:ListItem>
        <asp:ListItem>87</asp:ListItem>
        <asp:ListItem>88</asp:ListItem>
        <asp:ListItem>89</asp:ListItem>
    </asp:DropDownList>
        &nbsp;</p>
        </div>

    <p>Płeć:
    <asp:DropDownList id="DropDownList1" runat="server"  CssClass="span2">
        <asp:listitem Value="2">Kobieta</asp:listitem>
        <asp:listitem Value="1">Mężczyzna</asp:listitem>
    </asp:DropDownList>
    </p>
    
    <%-- Check box rozwijany z wojewodztwami --%>
   <div class="woje" style="display:inline-block;float:left;width:180px;">
    <div class="rozsun">
        <div id="divDDL2" class="divDDL2" runat="server" style="cursor:pointer;width:100px;">
            <div class="btn-group">
             <a class="btn dropdown-toggle">
             Województwo:  
             <span class="caret"></span>
             </a>
            </div>
            <div id="divDDL3" runat="server" height="1px"></div>
        </div>
    </div> 
    <asp:Panel ID="pnlWojewodztwa" runat="server" CssClass="MultipleSelectionDDL" >
            <asp:CheckBoxList ID="cblWojewodztwa" runat="server" >
            </asp:CheckBoxList>
        </asp:Panel>
        <br />
        <cc1:PopupControlExtender ID="pceSelections" runat="server"  TargetControlID="divDDL3"
               PopupControlID="pnlWojewodztwa" Position="Bottom" OffsetY="3" BehaviorID="popup" >
        </cc1:PopupControlExtender>
      
    <br />
    </div>
    <div class="zain" style="display:inline-block;margin-left:10px;width:180px;">
        <div class="rozsun">
            <div id="divDDL" class="divDDL2" runat="server">
            <div class="btn-group">
             <a class="btn dropdown-toggle">
                Zainteresowania: 
                 <span class="caret"></span>
             </a>
            </div>
             <div id="divDDLinner" runat="server"></div>
            </div>
        </div>
        <asp:Panel ID="pnlCustomers" runat="server" CssClass="MultipleSelectionDDL">
            <asp:CheckBoxList ID="cblCustomerList" runat="server" onclick="CountSelected(this)">
            </asp:CheckBoxList>
        </asp:Panel>
    </div>

        <cc1:PopupControlExtender ID="PopupControlExtender1" runat="server" TargetControlID="divDDLinner"
               PopupControlID="pnlCustomers" Position="Bottom" OffsetY="3" BehaviorID="popSport" >
        </cc1:PopupControlExtender>
    <div class="bud" style="display:inline-block;margin-left:10px;">
            <div class="btn-group">
             <a class="btn dropdown-toggle">
             Budowa ciała:  
             <span class="caret"></span>
             </a>
            </div>
        <asp:RadioButtonList ID="DDLWyglad" runat="server" DataTextField="budowa_opis" DataValueField="budowa_id" Width="200px" AppendDataBoundItems="True"></asp:RadioButtonList>

    </div>
    <div style="clear:both">
        <asp:Button ID="btnSearch" runat="server" Text="Szukaj" OnCommand="FillSzukane" CommandArgument="1" CssClass="btn btn-success" />
        <a href="javascript: history.go(-1)" class="btn btn-warning">Powrót</a>
    </div>
      <br />
    </div>
</form>
      <div class="span4" style="width:100%;margin-left:-3px;">
    <p>
        <asp:UpdatePanel runat="server" id="UpdatePanel1" updatemode="Conditional">
          
         <ContentTemplate>
               <script type="text/javascript">
                   Sys.Application.add_load(BindEvents);
               </script>
        <asp:ListView ID="ListView1" runat="server" GroupItemCount ="1">
        <GroupTemplate>
         <tr>
            <td id="itemPlaceHolder" runat="server"></td>
         </tr>
        </GroupTemplate>
        <LayoutTemplate>
            <table>
                <tr id="groupPlaceHolder" runat="server"></tr>
            </table>
          </LayoutTemplate>
          <ItemTemplate>
          <li class="span3" style="list-style: none outside none;margin-left:10px;margin-bottom:10px;">
              <div class="thumbnail">
                  <img src='photos/<%# Eval("username") %>image.jpg' id='<%# Eval("username") %>p' alt="No Photo" class="img-polaroid2" style="width:100px; height:100px;"/>
                 <div class="caption">
                   <h3><%# Eval("username") %></h3>
                     <p class="opis" id='<%# Eval("username") %>'><%# Eval("opis") %></p>
                      <p align="center"><a href='showprofile.aspx?userid=<%# Eval("userid") %>&username=<%# Eval("username") %>' class="btn btn-primary btn-block">Pokaż profil</a></p>
                        <p align="center"><a href='addfriend.aspx?userid=<%# Eval("userid") %>&username=<%# Eval("username") %>' class="btn btn-success btn-block"> Dodaj do ulubionych</a></p>
                          <p align="center"><a href='wyslijwiadomosc.aspx?userid=<%# Eval("userid") %>' class="btn btn-info btn-block"> Wyslij wiadomość</a></p>
                 </div>
              </div>
             </li>
          </ItemTemplate>
       </asp:ListView>
            <div class="pagination pagination-centered" style="clear:both;"> 
                <ul>
                    <div id="links" runat="server" style="clear:both;"></div>
                </ul>
            </div>
        </ContentTemplate>
        </asp:UpdatePanel>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:FriendsConnectionString %>" 
            SelectCommand="Szukaj" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="gender" PropertyName="SelectedValue"
                    />
                <asp:ControlParameter ControlID="DropDownList2" Name="dateDown" PropertyName="Text" 
                    Type="String" />
                <asp:ControlParameter ControlID="DropDownList3" Name="dateUp" PropertyName="Text" 
                    Type="String" />
                <asp:SessionParameter Name="userid" SessionField="userid" Type="String" />
                <asp:Parameter Name="wojewodztwo_id" />
            </SelectParameters>
        </asp:SqlDataSource>
    </p>
    </div>
</asp:Content>


