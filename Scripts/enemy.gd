extends CharacterBody2D

func pause():
	process_mode = PROCESS_MODE_DISABLED

func play():
	process_mode = PROCESS_MODE_INHERIT
