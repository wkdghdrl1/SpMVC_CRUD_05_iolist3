package com.biz.iolist.mapper;

import org.apache.ibatis.jdbc.SQL;

public class MemberSQL {
	
	public String member_insert_sql() {
		SQL sql = new SQL() {{
			// 무명클래스를 객체로 생성하고,
			// 값을 초기화하는 방법
			INSERT_INTO("tbl_member");
			INTO_COLUMNS("m_userid").INTO_VALUES("#{m_userid, jdbcType=VARCHAR}");
			VALUES("m_password", "#{m_password, jdbcType=VARCHAR }");
			VALUES("m_name , m_tel", "#{m_name, jdbcType=VARCHAR}, #{m_tel, jdbcType=VARCHAR}");
			INTO_COLUMNS("m_email").INTO_VALUES("#{m_email, jdbcType=VARCHAR}");
			INTO_COLUMNS("m_role").INTO_VALUES("#{m_role, jdbcType=VARCHAR}");
		}};
			
		return sql.toString();
	}
}
