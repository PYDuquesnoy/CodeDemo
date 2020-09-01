Class PYD.Lang Extends %RegisteredObject
{

ClassMethod Prepare() As %Status
{
    #DIM tSC as %Status=$$$OK
    #DIM errObj as %Exception.AbstractException
    try {
        Write !,"(pip)-Install some libraries",!
        ///$$$THROWONERROR(tSC,##class(%SYS.Python).Install("numpy"))
        $$$THROWONERROR(tSC,##class(%SYS.Python).Install("matplotlib"))
    }catch (errObj) {
        Write "CATCH:",errObj.DisplayString(),!
        set tSC=errObj.AsStatus()
    }
    quit tSC
}

ClassMethod Test1() As %Status
{
    #DIM tSC as %Status=$$$OK
    #DIM errObj as %Exception.AbstractException
    try {
        Write !,"Load the Libraries",!
        set np=##class(%SYS.Python).Import("numpy")
        set plt=##class(%SYS.Python).Import("matplotlib.pyplot")
        //Some data
        set x=np.linspace(0,5,11)
        set y=np.logspace(0,5,11)
        break
        //create empty canvas
        set fig=plt.figure()
        //set axes=fig.add_axes([0.1,0.1,0.8,0.8])
        do plt.plot(x,y,"r")
        do plt.xlabel("The X Axis")
        do plt.ylabel("the Y Axis")
        do plt.title("Logaritmic curve")

        do plt.savefig("/irisdev/app/img/testplot.png")
    }catch (errObj) {
        Write "CATCH:",errObj.DisplayString(),!
        set tSC=errObj.AsStatus()
    }
    quit tSC
}

ClassMethod Test2() As %Status
{
    #DIM tSC as %Status=$$$OK
    #DIM errObj as %Exception.AbstractException
    try {
        Write !,"Load the Libraries",!
        //set np=##class(%SYS.Python).Import("numpy")
        //set plt=##class(%SYS.Python).Import("matplotlib.pyplot")
        //set Axes3D=##class(%SYS.Python).Import("mpl_toolkits.mplot3d.axes3d")
        //Some data
        
        set str="import numpy as np"_$c(10)
        set str=str_"import matplotlib.pyplot as plt"_$c(10)
        set str=str_"import mpl_toolkits.mplot3d.axes3d"_$c(10)
        set str=str_"alpha = 0.7"_$c(10)
        set str=str_"phi_ext = 2 * np.pi * 0.5"_$c(10)
        set str=str_"def flux_qubit_potential(phi_m, phi_p): "_$c(10)
        set str=str_"    return 2 + alpha - 2 * np.cos(phi_p) * np.cos(phi_m) - alpha * np.cos(phi_ext - 2*phi_p)"_$c(10)
        set str=str_"phi_m = np.linspace(0, 2*np.pi, 100) "_$c(10)
        set str=str_"phi_p = np.linspace(0, 2*np.pi, 100) "_$c(10)
        set str=str_"X,Y = np.meshgrid(phi_p, phi_m) "_$c(10)
        set str=str_"Z = flux_qubit_potential(X, Y).T "_$c(10)
        set str=str_"fig = plt.figure(figsize=(8,6)) "_$c(10)
        set str=str_"ax = fig.add_subplot(1, 1, 1, projection='3d') "_$c(10)
        set str=str_"p = ax.plot_wireframe(X, Y, Z, rstride=4, cstride=4) "_$c(10)
        set str=str_"plt.savefig('/irisdev/app/img/3dplot.png') "_$c(10)
        set retval=##class(%SYS.Python).Run(str)
        Write "Run result:",retval,!

    }catch (errObj) {
        Write "CATCH:",errObj.DisplayString(),!
        set tSC=errObj.AsStatus()
    }
    quit tSC
}

}
