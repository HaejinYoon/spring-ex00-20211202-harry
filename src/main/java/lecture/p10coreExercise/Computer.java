package lecture.p10coreExercise;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import lombok.Getter;
import lombok.Setter;

@Component
@Getter
@Setter(onMethod_ = @Autowired)
public class Computer {
	private Memory memory;

//	public Memory getMemory() {
//		return memory;
//	}
//	@Autowired
//	public void setMemory(Memory memory) {
//		this.memory = memory;
//	}
}
