package demo.house.util;

import java.io.Serializable;

/**
 * Created by fanzhun on 2017/6/10.
 */
public class Messager<T> implements java.io.Serializable{

        private static final long serialVersionUID = -5638349724614921592L;

        private boolean flag;

        private T data;

        private String message;

        public Messager(){}

        public Messager(boolean flag, T data){
            this.flag = flag;
            this.data = data;
        }

        public Messager(boolean flag, String message){
            this.flag = flag;
            this.message = message
            ;
        }

        public T getData() {
            return data;
        }

        public void setData(T data) {
            this.data = data;
        }

        public boolean isFlag() {
            return flag;
        }

        public String getMessage() {
            return message;
        }

        public void setFlag(boolean flag) {
            this.flag = flag;
        }

        public void setMessage(String message) {
            this.message = message;
        }
}
