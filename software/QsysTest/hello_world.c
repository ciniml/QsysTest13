/*
 * "Hello World" example.
 *
 * This example prints 'Hello from Nios II' to the STDOUT stream. It runs on
 * the Nios II 'standard', 'full_featured', 'fast', and 'low_cost' example
 * designs. It runs with or without the MicroC/OS-II RTOS and requires a STDOUT
 * device in your system's hardware.
 * The memory footprint of this hosted application is ~69 kbytes by default
 * using the standard reference design.
 *
 * For a reduced footprint version of this template, and an explanation of how
 * to reduce the memory footprint for a given application, see the
 * "small_hello_world" template.
 *
 */
#include <system.h>
#include <stdint.h>

#define LED_OUT (*(volatile uint8_t*)PIO_0_BASE)
#define COUNTER_IN (*(volatile uint32_t*)ONCHIP_MEMORY2_0_BASE)

int main()
{
	volatile uint32_t counter = 0;
	while(1)
	{
//		for(counter = 0; counter < 1000000; counter++);
		volatile uint32_t value = COUNTER_IN;
		LED_OUT = value >> 16;
	}

  return 0;
}
