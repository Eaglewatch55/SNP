from tinydb import TinyDB, Query
import psycopg2
from psycopg2 import extras
from tkinter import Label, Button ,Entry, Scrollbar, Tk, ttk, Text, StringVar, END
from tkcalendar import Calendar
from datetime import datetime

#* RESTRICTIONS / LISTAS
debt_type = ["Simple Loan", "Revolver Credit", "Credit Card", "Leasing"]
currency = ["MXN","USD","EUR",
            "AUD","GBP","JPY","CHF","USD","AFN","ALL","DZD","AOA","ARS","AMD","AWG","AUD","ATS","BEF","AZN","BSD","BHD","BDT","BBD","BYR","BZD","BMD","BTN","BOB","BAM","BWP","BRL","GBP","BND","BGN","BIF","XOF","XAF","XPF","KHR","CAD","CVE","KYD","CLP","CNY","COP","KMF","CDF","CRC","HRK","CUC","CUP","CYP","CZK","DKK","DJF","DOP","XCD","EGP","SVC","EEK","ETB","EUR","FKP","FIM","FJD","GMD","GEL","DMK","GHS","GIP","GRD","GTQ","GNF","GYD","HTG","HNL","HKD","HUF","ISK","INR","IDR","IRR","IQD","IED","ILS","ITL","JMD","JPY","JOD","KZT","KES","KWD","KGS","LAK","LVL","LBP","LSL","LRD","LYD","LTL","LUF","MOP","MKD","MGA","MWK","MYR","MVR","MTL","MRO","MUR","MDL","MNT","MAD","MZN","MMK","ANG","NAD","NPR","NLG","NZD","NIO","NGN","KPW","NOK","OMR","PKR","PAB","PGK","PYG","PEN","PHP","PLN","PTE","QAR","RON","RUB","RWF","WST","STD","SAR","RSD","SCR","SLL","SGD","SKK","SIT","SBD","SOS","ZAR","KRW","ESP","LKR","SHP","SDG","SRD","SZL","SEK","CHF","SYP","TWD","TZS","THB","TOP","TTD","TND","TRY","TMM","UGX","UAH","UYU","AED","VUV","VEB","VND","YER","ZMK","ZWD"]
int_type = ["Fijo", "Variable"]
loan_type = ["Hipotecario", "Automotriz", "Capital de trabajo", "Maquinaria-Equipo"]
dict_loan_tables = {"Simple": "simple_loan","Revolvente":"revolver_credit","Arrendamiento":"leasing"}
dict_loan_payment_tables = {"Simple": "simple_payments","Revolvente":"revolver_dispositions","Arrendamiento":"leasing_payments"}
dict_payment_columns = {"Simple": ["id_simple_loan","period_number","payment_date","capital_amortization","interest_payment"], "Revolvente": ["id_revolver","disposition_date","payment_date","disposition_amount","interest_amount"], "Arrendamiento": ["id_leasing","period_number","payment_date","capital_amortization","interest_payment"]}

# #* GENERAL LAMBDA FUNCTIONS
# IF STATEMENT AT THE END IS FOR AVOIDING ITERATIONS WITH A NONETYPE
round_function = lambda number : round(number,2)



#* PSQL CONNECTION --------------------------------------------------------------------------------
#EXTRACT DATA FOR PSQL CONNECTION
db_config = TinyDB("SNP\config.json")
query = Query()
psql_config = db_config.search(query.user == 'py_connection')[0]
#CREATE STRING FOR CONNECTION WITH THE DICTIONARY
connection_address = f"host={psql_config['host']} port={psql_config['port']} user={psql_config['user']} password={psql_config['password']} dbname={psql_config['db_name']}"

# * POSTGRESQL FUNCTIONS
# LAMBDA
string_for_sql = lambda list1=[] : ",".join(map(str,list1)) if list1 is not None else ""

#FUNCTIONS
def lists_to_string (list1 = [], list2=[], separator=""):
    strings= []
    if len(list1)>0 and len(list1)==len(list2):
        for i in range(len(list1)):
            strings.append(str(list1[i])+separator+(str(list2[i])))
    
    return strings
        


#! MEJORAR CLARIDAD
def psql_connection (action, table, columns, **extra):
    elements_validation = lambda list_val: list_val if list_val is not None else ""

    # WHERE 'conditions' MUST be a string
    action_menu = { "SELECT_ALL": f"SELECT {string_for_sql(columns)} FROM {table}",
                    "SELECT_WHERE": f"SELECT {string_for_sql(columns)} FROM {table} WHERE {extra.get('conditions')}",
                    "INSERT": f"INSERT INTO {table} ({string_for_sql(columns)}) VALUES ({string_for_sql(elements_validation(extra.get('values')))})",
                    "UPDATE": f"UPDATE {table} SET {string_for_sql(lists_to_string(columns,elements_validation(extra.get('values')),'='))} WHERE {extra.get('conditions')}",
                    "DELETE": f"DELETE FROM {table} WHERE {extra.get('conditions')}",
                    }
    
    with psycopg2.connect(connection_address) as connection:
        with connection.cursor(cursor_factory=extras.DictCursor) as cursor:
            SQL = action_menu[action]
            print(SQL)
            cursor.execute(SQL)
            result = cursor.fetchall() if action.startswith("SELECT") else []
    return (result)


#* GUI DESIGN ---------------------------------------------------------------------------------------------------
#* TKINTER FUNCTIONS
#LAMBDA
id_extractor = lambda text: str(text.split(" - ")[0])

#FUNCTIONS
def add_simple_payment ():
    
    period = int(add_period.get())
    payment_date = datetime.strptime(bx_payment_date.get(), "%d/%m/%Y").date()
    capital = round_function(float(bx_add_capital.get()))
    interest = round_function(float(bx_add_interest.get()))
    total = capital+interest
    tx_simp_added.insert(END,f"{period}\t|{bx_payment_date.get()}\t\t|{capital:,}\t\t|{interest:,}\t\t|{total:,}\n",)
    add_period.set(str(period+1))
    
    id = id_extractor(cb_sla_select_loan.get())
    # id= cb_sla_select_loan.get()
    # id = id.split(" - ")
    # id = str(id[0])
    
    psql_connection("INSERT",
                    dict_loan_payment_tables[cb_sla_type.get()],
                    dict_payment_columns.get(cb_sla_type.get()),
                    values = [id,period,f"'{payment_date}'",capital,interest])
    

def add_revolver_disposition():
    disposition_date = datetime.strptime(bx_rev_disposition_date.get(), "%d/%m/%Y").date()
    payment_date = datetime.strptime(bx_rev_payment_date.get(), "%d/%m/%Y").date()
    capital = round_function(float(bx_rev_add_capital.get()))
    interest = round_function(float(bx_rev_add_interest.get()))
    total = capital + interest
    tx_rev_added.insert(END,f"{bx_rev_disposition_date.get()}\t\t|{bx_rev_payment_date.get()}\t\t|{capital:,}\t\t|{interest:,}\t\t|{total:,}\n",)
    
    id= id_extractor(cb_rev_select_loan.get())
    # id= cb_rev_select_loan.get()
    # id = id.split(" - ")
    # id = str(id[0])
    
    psql_connection("INSERT",
                    dict_loan_payment_tables["Revolvente"],
                    dict_payment_columns.get("Revolvente"),
                    values = [id,f"'{disposition_date}'",f"'{payment_date}'",capital,interest])

#* EVENTS
#   DELETE PREVIOUS TEXT AND AUTOFILLS FOR THE SELECTED LOAN
def simp_txt_autofill (event):
    
    selection = str(cb_sla_type.get())
    dict_tx_added = {"Simple": "ID\t|Periodo\t|F. Pago\t\t|Capital\t\t|Interés\t\t|Total\n",
                     "Arrendamiento":"ID\t|Periodo\t|F. Pago\t\t|Amortización\t\t|Interés\t\t|Total\n"}
    dict_type_id_loan= {"Simple" : "id_simple_loan", "Arrendamiento": "id_leasing"}
    
    selected_loan = cb_sla_select_loan.get()
    tx_simp_added.delete("1.0",END)
    tx_simp_added.insert("1.0", dict_tx_added[selection])
    
    payments = psql_connection("SELECT_WHERE",
                            dict_loan_payment_tables[selection],
                            dict_payment_columns[selection],
                            conditions = f"{dict_type_id_loan[selection]}={id_extractor(selected_loan)}")
    if payments is not None:
        for row in payments:
                total = row[3]+row[4]
                tx_simp_added.insert(END,f"{row[0]}\t|{row[1]}\t|{row[2]}\t\t|{row[3]}\t\t|{row[4]}\t\t|{total}\n")
        
                        

def rev_clear_box (event):
    tx_rev_added.delete("1.0",END)
    tx_rev_added.insert("1.0", "F. Disupesto\t|F. Pago\t\t|Capital\t\t|Interés\t\t|Total\n")

# cb_sla_type BIND
def sla_type_selected (event):
    
    selection = str(cb_sla_type.get())
    cb_sla_select_loan["values"] = loan_list_join(selection) 

def loan_list_join (selection):
        
        dict_loan_type = {"Simple": "simple_loan","Revolvente":"revolver","Arrendamiento":"leasing"}  
        loan_type = dict_loan_tables.get(selection)
        
        #QUERY WITH  VARIABLE'ID' NAME
        query = psql_connection("SELECT_ALL",loan_type,["id_"+dict_loan_type[selection],"alias","financial_entity"])
    
        # CONVERT 'ID' TO STRING
        for i in range(len(query)): 
            query[i][0] = str(query[i][0])
        
        # print(query)         
        select_loan_menu = [" - ".join(query[i]) for i in range(len(query))]
        return select_loan_menu
    

#WINDOW
window = Tk()
window.title ("SNP")
window.geometry("650x650")

#TABS
tab_control= ttk.Notebook(window)

tab_loans = ttk.Frame(tab_control)
tab_control.add(tab_loans, text="Créditos")

tab_balance = ttk.Frame(tab_control)
tab_control.add(tab_balance, text="Saldos")

tab_weekly_report = ttk.Frame(tab_control)
tab_control.add(tab_weekly_report, text="Rep. Semanal")

tab_monthly_report = ttk.Frame(tab_control)
tab_control.add(tab_monthly_report, text="Rep. Mensual")

tab_control.pack(fill= "both")

#--- LOANS TAB
loan_tab_control = ttk.Notebook(tab_loans)

ltab_add_simple = ttk.Frame(loan_tab_control)
loan_tab_control.add(ltab_add_simple, text="Añadir crédito")

ltab_add_simple_payments = ttk.Frame(loan_tab_control)
loan_tab_control.add(ltab_add_simple_payments, text="Pagos Simples")

ltab_add_revolver_disposition = ttk.Frame(loan_tab_control)
loan_tab_control.add(ltab_add_revolver_disposition, text="Pagos Revolventes")

# ltab_review_loan = ttk.Frame(loan_tab_control)
# loan_tab_control.add(ltab_review_loan, text="Revisar-Editar")

loan_tab_control.pack(fill="both")

#--- --- SIMPLE LOAN ADD TAB

lb_loan_alias = Label(ltab_add_simple, text= "Alias:")
bx_loan_alias = Entry(ltab_add_simple)
lb_loan_ammount = Label(ltab_add_simple, text= "Monto:")
bx_loan_ammount = Entry(ltab_add_simple)
lb_loan_number = Label(ltab_add_simple, text= "No. crédito:")
bx_loan_number = Entry(ltab_add_simple)
lb_currency = Label(ltab_add_simple, text="Moneda:")
cb_currency = ttk.Combobox(ltab_add_simple, state="readonly", values= currency)
lb_interest_type = Label(ltab_add_simple, text="Tasa:")
cb_interest_type = ttk.Combobox(ltab_add_simple, values= int_type)
lb_interest_rate = Label(ltab_add_simple, text="Tasa interés:")
bx_interest_rate = Entry(ltab_add_simple)
lb_months_term = Label(ltab_add_simple, text="Meses:") #* MODIFY TO PERIODS AND PERIODICITY
bx_months_term = Entry(ltab_add_simple)
lb_financial_entity = Label(ltab_add_simple, text="Entidad Financiera:")
bx_financial_entity = Entry(ltab_add_simple)
lb_loan_type = Label(ltab_add_simple, text="Tipo de crédito:")
cb_loan_type = ttk.Combobox(ltab_add_simple, values= [key for key in dict_loan_tables.keys()]) #Cambidado a lista definida para uso posterior de diccionario
lb_start_date = Label(ltab_add_simple, text="Fecha de inicio:")
cal_start_date = Calendar(ltab_add_simple, selectmode = "day")
lb_end_date = Label(ltab_add_simple, text="Fecha de termino:")
cal_end_date = Calendar(ltab_add_simple, selectmode = "day")

lb_loan_alias.grid(row=0, column=0)
bx_loan_alias.grid(row=0, column=1)
lb_loan_ammount.grid(row=1, column=0)
bx_loan_ammount.grid(row=1, column=1)
lb_loan_number.grid(row=2, column=0)
bx_loan_number.grid(row=2, column=1)
lb_currency.grid(row=3, column=0)
cb_currency.grid(row=3, column=1)
lb_interest_type.grid(row=4, column=0)
cb_interest_type.grid(row=4, column=1)
lb_interest_rate.grid(row=5, column=0)
bx_interest_rate.grid(row=5, column=1)
lb_months_term.grid(row=6, column=0)
bx_months_term.grid(row=6, column=1)
lb_financial_entity.grid(row=7, column=0)
bx_financial_entity.grid(row=7, column=1)
lb_loan_type.grid(row=8, column=0)
cb_loan_type.grid(row=8, column=1)
lb_start_date.grid(row=9, column=0)
cal_start_date.grid(row=9, column=1)
lb_end_date.grid(row=10, column=0)
cal_end_date.grid(row=10, column=1)

#--- --- SIMPLE LOAN / LEASING  ADD PAYMENTS TAB

lb_sla_type = Label(ltab_add_simple_payments,text="Tipo de crédito:")
cb_sla_type = ttk.Combobox(ltab_add_simple_payments, values= ["Simple", "Arrendamiento"], state= "readonly")
cb_sla_type.bind("<<ComboboxSelected>>",sla_type_selected)
lb_sla_select_loan = Label(ltab_add_simple_payments, text="Crédito:")
cb_sla_select_loan = ttk.Combobox(ltab_add_simple_payments, values=[])
cb_sla_select_loan.bind("<<ComboboxSelected>>",simp_txt_autofill)

lb_period = Label(ltab_add_simple_payments, text="Periodo")
lb_payment_date = Label(ltab_add_simple_payments, text="F. Pago")
lb_capital = Label(ltab_add_simple_payments, text="Capital")
lb_interest = Label(ltab_add_simple_payments, text="Interés")


add_period = StringVar(value="1")
lb_period_num = Label(ltab_add_simple_payments, textvariable= add_period)
bx_payment_date = Entry(ltab_add_simple_payments)
bx_add_capital = Entry(ltab_add_simple_payments)
bx_add_interest = Entry(ltab_add_simple_payments)
bt_add_payment = Button(ltab_add_simple_payments, text="Agregar", command= add_simple_payment)
tx_simp_added = Text(ltab_add_simple_payments, height= 10, width= 80)

lb_sla_type.grid(row=0 ,column=0)
cb_sla_type.grid(row=0 ,column=1, columnspan=2)
lb_sla_select_loan.grid(row=1 ,column=0)
cb_sla_select_loan.grid(row=1 ,column=1, columnspan=2)
lb_period.grid(row=2 ,column=0)
lb_payment_date.grid(row=2 ,column=1)
lb_capital.grid(row=2 ,column=2)
lb_interest.grid(row=2 ,column=3)
bt_add_payment.grid(row=2 ,column=4 ,rowspan=2)
lb_period_num.grid(row=3 ,column=0)
bx_payment_date.grid(row=3 ,column=1)
bx_add_capital.grid(row=3 ,column=2)
bx_add_interest.grid(row=3 ,column=3)

tx_simp_added.grid(row=4 ,column=0 ,columnspan=5)


#--- --- ADD  REVOLVER DISPOSITIONS TAB
lb_rev_type = Label(ltab_add_revolver_disposition,text="Tipo de crédito:")
lb1_rev_type = Label(ltab_add_revolver_disposition, text="Revolvente")
lb_rev_select_loan = Label(ltab_add_revolver_disposition, text="Crédito:")
cb_rev_select_loan = ttk.Combobox(ltab_add_revolver_disposition, values=loan_list_join("Revolvente"))
cb_rev_select_loan.bind("<<ComboboxSelected>>",rev_clear_box)

lb_rev_disposition_date = Label(ltab_add_revolver_disposition, text="F. Disposición")
lb_rev_payment_date = Label(ltab_add_revolver_disposition, text="F. Pago")
lb_rev_capital = Label(ltab_add_revolver_disposition, text="Capital")
lb_rev_interest = Label(ltab_add_revolver_disposition, text="Interés")

bx_rev_disposition_date = Entry(ltab_add_revolver_disposition)
bx_rev_payment_date = Entry(ltab_add_revolver_disposition)
bx_rev_add_capital = Entry(ltab_add_revolver_disposition)
bx_rev_add_interest = Entry(ltab_add_revolver_disposition)
bt_rev_add_payment = Button(ltab_add_revolver_disposition, text="Agregar", command=add_revolver_disposition)
tx_rev_added = Text(ltab_add_revolver_disposition, height= 10, width= 80)


lb_rev_type.grid(row=0 ,column=0)
lb1_rev_type.grid(row=0 ,column=1, columnspan=2)
lb_rev_select_loan.grid(row=1 ,column=0)
cb_rev_select_loan.grid(row=1 ,column=1, columnspan=2)
lb_rev_disposition_date.grid(row=2 ,column=0)
lb_rev_payment_date.grid(row=2 ,column=1)
lb_rev_capital.grid(row=2 ,column=2)
lb_rev_interest.grid(row=2 ,column=3)
bt_rev_add_payment.grid(row=2 ,column=4 ,rowspan=2)
bx_rev_disposition_date.grid(row=3 ,column=0)
bx_rev_payment_date.grid(row=3 ,column=1)
bx_rev_add_capital.grid(row=3 ,column=2)
bx_rev_add_interest.grid(row=3 ,column=3)

tx_rev_added.grid(row=4 ,column=0 ,columnspan=5)



#--- --- SIMPLE LOAN REVIEW TAB

# lb_loan_review = Label(ltab_review_loan, text="Crédito:")
# cb_loan_review = Label(ltab_review_loan, )

window.mainloop()

#* ----------------------------------------
