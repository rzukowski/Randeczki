<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="szukajprzyjaciol.aspx.cs" Inherits="szukajprzyjaciol" Title="Untitled Page" %>
<%@ Register assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.WebControls" tagprefix="asp" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="AjaxControlToolkit" %>




<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <script type="text/javascript">
        function BindEvents() {
           $(document).ready(function () {
                $(".opis").each(function () {
                    $(this).hide();
                });
           });
            //tutaj skrypt do nadawania obiektom z klasa 'opis' i 'id' status visible (lub tez dopisywanie nowej klasy
            //powodującej ze 'opis' bedzie jako chmurka
           $("img").mouseover(function(e){
               var href = $(this).attr('id');
               var id = href.substring(0, href.length - 1);
               var text = $("#" + id).text();
               if (text == "") {
                   text = "Brak opisu...";
               }
               else {
                   if (text.length > 10) {
                       var ii = 10;
                       while (text.charAt(ii) != " " && ii!=text.length)
                           ii++;
                       if(ii!=text.length)
                        text = text.substring(0, ii) + "...";
                   }


               }
               $(this).after('<div id="tooltip"><div class="tipBody">' + text + '</div></div>');
               $('#tooltip').css('top', e.pageY + 10);
               $('#tooltip').css('left', e.pageX + 20);

               $('#tooltip').fadeIn('500');
               $('#tooltip').fadeTo('10', 0.8);

           }).mousemove(function(e) { 
               
               $('#tooltip').css('top', e.pageY + 10 );
               $('#tooltip').css('left', e.pageX + 20 );
        
           }).mouseout(function() {

               $('div#tooltip').remove();

           });

        }

        

        </script>


    <asp:ScriptManager   
            ID="ScriptManager2"  
            runat="server"  
            >  
        </asp:ScriptManager>  
  

    <h2>Szukaj</h2>
    <p>&nbsp;<p>Wiek od :&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:DropDownList ID="DropDownList2" runat="server">
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
    <asp:DropDownList ID="DropDownList3" runat="server">
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

    <p>Płeć:
    <asp:DropDownList id="DropDownList1" runat="server" >
  <asp:listitem Value="2">Kobieta</asp:listitem>
  <asp:listitem Value="1">Mężczyzna</asp:listitem>
</asp:DropDownList>
    </p>
        </p>
    <%-- Check box rozwijany z wojewodztwami --%>
        <div id="divDDL2" class="divDDL2" runat="server">
        Województwo
       </div>
    <asp:Panel ID="pnlWojewodztwa" runat="server" CssClass="MultipleSelectionDDL">
            <asp:CheckBoxList ID="cblWojewodztwa" runat="server" >
            </asp:CheckBoxList>
        </asp:Panel>
        <br />
        <cc1:PopupControlExtender ID="pceSelections" runat="server" TargetControlID="divDDL2"
               PopupControlID="pnlWojewodztwa" Position="Bottom" OffsetY="-1" >
        </cc1:PopupControlExtender>
       
    <p class="center" >


        <asp:Button ID="btnSearch" runat="server" Text="Szukaj" OnClick="AddWojewodztwoParameter"/>
    &nbsp;</p>
    <p>
        <asp:UpdatePanel runat="server" id="UpdatePanel1" updatemode="Conditional">
          
         <ContentTemplate>
               <script type="text/javascript">
                   Sys.Application.add_load(BindEvents);
     </script>
        <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1" GroupItemCount ="2">
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
          <td>
             <table>
                <tr><h3> <%# Eval("username") %></h3></tr>
                 <tr>
                  <td> <img src='photos/<%# Eval("username") %>image.jpg' id='<%# Eval("username") %>p' alt="No Photo"  width="100px" height="100px" /></td>
                  <td> 
                     <p class="opis" id='<%# Eval("username") %>'><%# Eval("opis") %></p>
                     <a href='showprofile.aspx?userid=<%# Eval("userid") %>&username=<%# Eval("username") %>'>Pokaż profil</a> <br />
                     <a href='addfriend.aspx?userid=<%# Eval("userid") %>&username=<%# Eval("username") %>'> Dodaj do ulubionych</a> <br />
                       <a href='wyslijwiadomosc.aspx?userid=<%# Eval("userid") %>'> Wyslij wiadomość</a>
                  </td>
                </tr>
             </table>
             </td>
          </ItemTemplate>
       </asp:ListView>
        <asp:DataPager ID="lvDataPager1" runat="server" PagedControlID="ListView1" PageSize="1">
            <Fields>
                <asp:NumericPagerField ButtonType="Link" />
            </Fields>
        </asp:DataPager>

        </ContentTemplate>
            <Triggers>
<asp:AsyncPostBackTrigger ControlID="btnSearch"
     EventName="Click" />
</Triggers>
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
   <p align="center"> <a href="javascript: history.go(-1)">Powrót</a></p>
</asp:Content>


