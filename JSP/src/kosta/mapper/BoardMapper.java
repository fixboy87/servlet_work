package kosta.mapper;

import java.util.List;

import org.apache.ibatis.session.RowBounds;

import kosta.bean.Board;
import kosta.bean.Recomment;
import kosta.bean.Search;

public interface BoardMapper {
	int insertBoard(Board board);
	List<Board> listBoard(RowBounds row, Search search);
	Board getBoard(int seq);
	int updateBoard(Board board);
	int deleteBoard(int seq);
	int countBoard(Search search);
	Recomment getRecomment(int seq);
}
