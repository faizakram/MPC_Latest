package com.mpc.ServiceInterFace;

import java.util.List;

import com.mpc.Entity.Conversation;
import com.mpc.Entity.Conversationcomment;
import com.mpc.Entity.Subtopic;
import com.mpc.Entity.Topic;
import com.mpc.Entity.User;

public interface ConversationServiceInterFace {

	List<Conversation> findAllConversionInfoOrderByDate();

	List<Topic> findAllConversionTopicInfo();

	List<Subtopic> findAllConversionSubTopicInfo();

	String addConversation(String topicName, String subTopicName,
			String[] userlist, String conversationContent);

	String addCommentConversation(Integer conversationId, String[] userlist,
			String conversationcommentContent);

	List<Conversationcomment> findAllCommentById(Integer conversationId);

	List<User> findAllUsers();

	List<Conversation> findAllConversionInfoByVesselName(String vesselName);


	 

}
