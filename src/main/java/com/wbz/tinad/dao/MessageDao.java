
package com.wbz.tinad.dao;

import com.wbz.tinad.beans.Message;
import com.wbz.tinad.beans.Utilisateur;

public interface MessageDao {
    void crer(Message m)throws Exception;
    Message[] listMessage(Utilisateur utilisateur) throws Exception ; 
}
