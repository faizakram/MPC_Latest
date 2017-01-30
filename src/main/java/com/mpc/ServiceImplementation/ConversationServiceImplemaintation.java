package com.mpc.ServiceImplementation;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mpc.DAOInterFace.ConversationDAOInterFace;
import com.mpc.Entity.Conversation;
import com.mpc.Entity.Conversationcomment;
import com.mpc.Entity.Subtopic;
import com.mpc.Entity.Topic;
import com.mpc.Entity.User;
import com.mpc.GetCurrentDateTime.GetCurrentDateTime;
import com.mpc.ServiceInterFace.ConversationServiceInterFace;

@Service
public class ConversationServiceImplemaintation implements ConversationServiceInterFace{

	@Autowired
	private ConversationDAOInterFace conversationDAOInterFace;
	@Autowired
	private GetCurrentDateTime getCurrentDateTime;
	@Autowired
	private Conversationcomment conversationcomment;
	
	@Override
	@Transactional
	public List<Conversation> findAllConversionInfoOrderByDate() {
		return conversationDAOInterFace.findAllConversionInfoOrderByDate();
	}

	@Override
	@Transactional
	public List<Topic> findAllConversionTopicInfo() {
		return conversationDAOInterFace.findAllConversionTopicInfo();
	}

	@Override
	@Transactional
	public List<Subtopic> findAllConversionSubTopicInfo() {
		return conversationDAOInterFace.findAllConversionSubTopicInfo();
	}

	@Override
	@Transactional
	public String addConversation(String topicName, String subTopicName,
			String[] userlist, String conversationContent) {
		Topic topic = conversationDAOInterFace.findTopicByName(topicName);
		Subtopic subTopic = conversationDAOInterFace.findSubTopicByName(subTopicName);
		for(int i=0; i< userlist.length; i++){
		User user = conversationDAOInterFace.findConversationUserByName(userlist[i]);
		Conversation  conversation = new Conversation();
		conversation.setContentText(conversationContent);
		conversation.setTopic(topic);
		conversation.setSubtopic(subTopic);
		conversation.setUser(user);
		conversation.setStartedDate(getCurrentDateTime.getCurrentDate());
		conversationDAOInterFace.addConversation(conversation);
		}
		return "Success";
	}

	@Override
	@Transactional
	public String addCommentConversation(Integer conversationId,
			String[] userlist, String conversationcommentContent) {
		Conversation conversation = conversationDAOInterFace.
				findConversationById(conversationId);
		if(userlist != null){
		for(int i=0; i< userlist.length; i++){
		Conversationcomment conversationcomment = new Conversationcomment();
		User user = conversationDAOInterFace.findConversationUserByName(userlist[i]);
		conversationcomment.setConversation(conversation);
		conversationcomment.setCommentText(conversationcommentContent);
		conversationcomment.setUser(user);
		conversationcomment.setDateTime(getCurrentDateTime.getCurrentDate());
		conversationDAOInterFace.addCommentConversation(conversationcomment);
		}
		}
		else{
			conversationcomment.setConversation(conversation);
			conversationcomment.setCommentText(conversationcommentContent);
			conversationcomment.setUser(conversation.getUser());
			conversationcomment.setDateTime(getCurrentDateTime.getCurrentDate());
			conversationDAOInterFace.addCommentConversation(conversationcomment);
		}
		return "Success";
	}

	@Override
	@Transactional
	public List<Conversationcomment> findAllCommentById(Integer conversationId) {
		return conversationDAOInterFace.findAllCommentById(conversationId);
	}

	@Override
	@Transactional
	public List<User> findAllUsers() {
		return conversationDAOInterFace.findAllUsers();
	}

	@Override
	@Transactional
	public List<Conversation> findAllConversionInfoByVesselName(String vesselName) {
		return conversationDAOInterFace.findAllConversionInfoByVesselName(vesselName);
	}


	 
	
	

}
