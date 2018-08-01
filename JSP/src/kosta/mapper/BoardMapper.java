package kosta.mapper;

import java.util.List;

import kosta.bean.Board;

public interface BoardMapper {
	int insertBoard(Board board);
	List<Board> listBoard();
}
