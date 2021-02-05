" Maintainer: Kyle Laker <kyle@laker.email>
" Last Change: 2020 Jul 11

if exists("b:current_syntax")
    finish
endif

setlocal iskeyword+="-.@"
syntax case match

syntax match   riscvComment    /\v(#|\/\/).*$/
syntax match   riscvTodo       /\v\c<(fix(me)?|note[s]?|todo|issue|bug|task)[:]?/ containedin=.*Comment
" Decimal numbers
syntax match   riscvNumber     /\<[-]\?\d\+\>/
" Hex numbers
syntax match   riscvNumber     /\<-\?0\(x\|X\)[0-9a-fA-F]\+\>/
syntax region  riscvString     start=/"/ skip=/\\"/ end=/"/
syntax region  riscvChar       start=/'/ skip=/\\'/ end=/'/
syntax match   riscvLabelColon /:/ contained
syntax match   riscvLabel      /\w\+:/ contains=riscvLabelColon

" Registers
" Numbered registers
syntax match   riscvRegister /\<x\([1-2]?[0-9]\|3[0-1]\)\>/

" Symbolic register names
syntax keyword riscvRegister zero ra sp gp tp fp pc
syntax keyword riscvRegister a0 a1 a2 a3 a4 a5 a6 a7
syntax keyword riscvRegister t0 t1 t2 t3 t4 t5 t6
syntax keyword riscvRegister s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11
syntax keyword riscvRegister mepc mscratch mtvec mstatus mcause mie mpie mtval mip mpp

" Assembler directives
syntax keyword riscvDirective ".align" ".file" ".globl" ".local" ".comm" ".common" ".ident" ".section"
syntax keyword riscvDirective ".size" ".text" ".data" ".rodata" ".bss" ".string" ".asciz" ".ascii" ".equ"
syntax keyword riscvDirective ".altmacro" ".macro" ".endm" ".type" ".option" ".byte" ".2byte" ".4byte"
syntax keyword riscvDirective ".8byte" ".hword" ".word" ".quad" ".skip" ".dtprelword" ".dtpreldword"
syntax keyword riscvDirective ".sleb128" ".uleb128" ".p2align" ".balign" ".zero" ".global" ".globl" ".float"
syntax keyword riscvDirective ".double" ".else" ".elseif" ".endef" ".equ" ".equiv" ".equv" ".err" ".error"
syntax keyword riscvDirective ".exitm" ".fill" ".if" ".incbin" ".include" ".print" ".space" ".warning"

" Instructions
" RV32A
syntax keyword riscvInstruction amoadd.w amoxor.w amoor.w amoand.w amomin.w amomax.w amominu.w amomaxu.w
syntax keyword riscvInstruction amoswap.w lr.w sc.w

" RV32C
syntax keyword riscvInstruction @c.srli.rv32 @c.srai.rv32 @c.slli.rv32

" RV32D
syntax keyword riscvInstruction fadd.d fsub.d fmul.d fdiv.d fsgnj.d fsgnjn.d fsgnjx.d fmin.d fmax.d fcvt.s.d
syntax keyword riscvInstruction fcvt.d.s fsqrt.d fle.d flt.d feq.d fcvt.w.d fcvt.wu.d fclass.d fcvt.d.w
syntax keyword riscvInstruction fcvt.d.wu fld fsd fmadd.d fmsub.d fnmsub.d fnmadd.d

" RV32F
syntax keyword riscvInstruction fadd.s fsub.s fmul.s fdiv.s fsgnj.s fsgnjn.s fsgnjx.s fmin.s fmax.s fsqrt.s
syntax keyword riscvInstruction fle.s flt.s feq.s fcvt.w.s fcvt.wu.s fmv.x.w fclass.s fcvt.s.w fcvt.s.wu
syntax keyword riscvInstruction fmv.w.x flw fsw fmadd.s fmsub.s fnmsub.s fnmadd.s

" RV32I
syntax keyword riscvInstruction beq bne blt bge bltu bgeu jalr jal lui auipc addi slli slti sltiu xori srli
syntax keyword riscvInstruction srai ori andi add sub sll slt sltu xor srl sra or and lb lh lw lbu lhu sb sh sw
syntax keyword riscvInstruction fence fence.i

" RV32M
syntax keyword riscvInstruction mul mulh mulhsu mulhu div divu rem remu

" RV32Q
syntax keyword riscvInstruction fadd.q fsub.q fmul.q fdiv.q fsgnj.q fsgnjn.q fsgnjx.q fmin.q fmax.q fcvt.s.q
syntax keyword riscvInstruction fcvt.q.s fcvt.d.q fcvt.q.d fsqrt.q fle.q flt.q feq.q fcvt.w.q fcvt.wu.q
syntax keyword riscvInstruction fclass.q fcvt.q.w fcvt.q.wu flq fsq fmadd.q fmsub.q fnmsub.q fnmadd.q

" RV64A
syntax keyword riscvInstruction amoadd.d amoxor.d amoor.d amoand.d amomin.d amomax.d amominu.d amomaxu.d
syntax keyword riscvInstruction amoswap.d lr.d sc.d

" RV64C
syntax keyword riscvInstruction @c.ld @c.sd c.subw c.addw @c.addiw @c.ldsp @c.sdsp

" RV64D
syntax keyword riscvInstruction fcvt.l.d fcvt.lu.d fmv.x.d fcvt.d.l fcvt.d.lu fmv.d.x

" RV64F
syntax keyword riscvInstruction fcvt.l.s fcvt.lu.s fcvt.s.l fcvt.s.lu

" RV64I
syntax keyword riscvInstruction addiw slliw srliw sraiw addw subw sllw srlw sraw ld lwu sd

" RV64M
syntax keyword riscvInstruction mulw divw divuw remw remuw

" RV64Q
syntax keyword riscvInstruction fcvt.l.q fcvt.lu.q fcvt.q.l fcvt.q.lu

" RVC
syntax keyword riscvInstruction @c.nop @c.addi16sp @c.jr @c.jalr @c.ebreak c.addi4spn c.fld c.lw c.flw c.fsd
syntax keyword riscvInstruction c.sw c.fsw c.addi c.jal c.li c.lui c.srli c.srai c.andi c.sub c.xor c.or c.and
syntax keyword riscvInstruction c.j c.beqz c.bnez c.slli c.fldsp c.lwsp c.flwsp c.mv c.add c.fsdsp c.swsp
syntax keyword riscvInstruction c.fswsp

" RVV
syntax keyword riscvInstruction vsetvli vsetvl vle8.v vle16.v vle32.v vle64.v vse8.v vse16.v vse32.v vse64.v
syntax keyword riscvInstruction vlse8.v vlse16.v vlse32.v vlse64.v vsse8.v vsse16.v vsse32.v vsse64.v vlxei8.v
syntax keyword riscvInstruction vlxei16.v vlxei32.v vlxei64.v vsxei8.v vsxei16.v vsxei32.v vsxei64.v vsuxei8.v
syntax keyword riscvInstruction vsuxei16.v vsuxei32.v vsuxei64.v vle8ff.v vle16ff.v vle32ff.v vle64ff.v vl1r.v
syntax keyword riscvInstruction vs1r.v vfadd.vf vfsub.vf vfmin.vf vfmax.vf vfsgnj.vf vfsgnjn.vf vfsgnjx.vf
syntax keyword riscvInstruction vfslide1up.vf vfslide1down.vf vfmv.s.f vfmerge.vfm vfmv.v.f vmfeq.vf vmfle.vf
syntax keyword riscvInstruction vmflt.vf vmfne.vf vmfgt.vf vmfge.vf vfdiv.vf vfrdiv.vf vfmul.vf vfrsub.vf
syntax keyword riscvInstruction vfmadd.vf vfnmadd.vf vfmsub.vf vfnmsub.vf vfmacc.vf vfnmacc.vf vfmsac.vf
syntax keyword riscvInstruction vfnmsac.vf vfwadd.vf vfwsub.vf vfwadd.wf vfwsub.wf vfwmul.vf vfwmacc.vf
syntax keyword riscvInstruction vfwnmacc.vf vfwmsac.vf vfwnmsac.vf vfadd.vv vfredsum.vs vfsub.vv vfredosum.vs
syntax keyword riscvInstruction vfmin.vv vfredmin.vs vfmax.vv vfredmax.vs vfsgnj.vv vfsgnjn.vv vfsgnjx.vv
syntax keyword riscvInstruction vfmv.f.s vmfeq.vv vmfle.vv vmflt.vv vmfne.vv vfdiv.vv vfmul.vv vfmadd.vv
syntax keyword riscvInstruction vfnmadd.vv vfmsub.vv vfnmsub.vv vfmacc.vv vfnmacc.vv vfmsac.vv vfnmsac.vv
syntax keyword riscvInstruction vfcvt.xu.f.v vfcvt.x.f.v vfcvt.f.xu.v vfcvt.f.x.v vfcvt.rtz.xu.f.v
syntax keyword riscvInstruction vfcvt.rtz.x.f.v vfwcvt.xu.f.v vfwcvt.x.f.v vfwcvt.f.xu.v vfwcvt.f.x.v
syntax keyword riscvInstruction vfwcvt.f.f.v vfwcvt.rtz.xu.f.v vfwcvt.rtz.x.f.v vfncvt.xu.f.w vfncvt.x.f.w
syntax keyword riscvInstruction vfncvt.f.xu.w vfncvt.f.x.w vfncvt.f.f.w vfncvt.rod.f.f.w vfncvt.rtz.xu.f.w
syntax keyword riscvInstruction vfncvt.rtz.x.f.w vfsqrt.v vfclass.v vfwadd.vv vfwredsum.vs vfwsub.vv
syntax keyword riscvInstruction vfwredosum.vs vfwadd.wv vfwsub.wv vfwmul.vv vfdot.vv vfwmacc.vv vfwnmacc.vv
syntax keyword riscvInstruction vfwmsac.vv vfwnmsac.vv vadd.vx vsub.vx vrsub.vx vminu.vx vmin.vx vmaxu.vx
syntax keyword riscvInstruction vmax.vx vand.vx vor.vx vxor.vx vrgather.vx vslideup.vx vslidedown.vx vadc.vxm
syntax keyword riscvInstruction vmadc.vxm vsbc.vxm vmsbc.vxm vmerge.vxm vmv.v.x vmseq.vx vmsne.vx vmsltu.vx
syntax keyword riscvInstruction vmslt.vx vmsleu.vx vmsle.vx vmsgtu.vx vmsgt.vx vsaddu.vx vsadd.vx vssubu.vx
syntax keyword riscvInstruction vssub.vx vsll.vx vsmul.vx vsrl.vx vsra.vx vssrl.vx vssra.vx vnsrl.wx vnsra.wx
syntax keyword riscvInstruction vnclipu.wx vnclip.wx vqmaccu.vx vqmacc.vx vqmaccus.vx vqmaccsu.vx vadd.vv
syntax keyword riscvInstruction vsub.vv vminu.vv vmin.vv vmaxu.vv vmax.vv vand.vv vor.vv vxor.vv vrgather.vv
syntax keyword riscvInstruction vadc.vvm vmadc.vvm vsbc.vvm vmsbc.vvm vmerge.vvm vmv.v.v vmseq.vv vmsne.vv
syntax keyword riscvInstruction vmsltu.vv vmslt.vv vmsleu.vv vmsle.vv vsaddu.vv vsadd.vv vssubu.vv vssub.vv
syntax keyword riscvInstruction vsll.vv vsmul.vv vsrl.vv vsra.vv vssrl.vv vssra.vv vnsrl.wv vnsra.wv vnclipu.wv
syntax keyword riscvInstruction vnclip.wv vwredsumu.vs vwredsum.vs vdotu.vv vdot.vv vqmaccu.vv vqmacc.vv
syntax keyword riscvInstruction vqmaccsu.vv vadd.vi vrsub.vi vand.vi vor.vi vxor.vi vrgather.vi vslideup.vi
syntax keyword riscvInstruction vslidedown.vi vadc.vim vmadc.vim vmerge.vim vmv.v.i vmseq.vi vmsne.vi vmsleu.vi
syntax keyword riscvInstruction vmsle.vi vmsgtu.vi vmsgt.vi vsaddu.vi vsadd.vi vsll.vi vmv1r.v vmv2r.v vmv4r.v
syntax keyword riscvInstruction vmv8r.v vsrl.vi vsra.vi vssrl.vi vssra.vi vnsrl.wi vnsra.wi vnclipu.wi
syntax keyword riscvInstruction vnclip.wi vredsum.vs vredand.vs vredor.vs vredxor.vs vredminu.vs vredmin.vs
syntax keyword riscvInstruction vredmaxu.vs vredmax.vs vaaddu.vv vaadd.vv vasubu.vv vasub.vv vmv.x.s vzext.vf8
syntax keyword riscvInstruction vsext.vf8 vzext.vf4 vsext.vf4 vzext.vf2 vsext.vf2 vcompress.vm vmandnot.mm
syntax keyword riscvInstruction vmand.mm vmor.mm vmxor.mm vmornot.mm vmnand.mm vmnor.mm vmxnor.mm vmsbf.m
syntax keyword riscvInstruction vmsof.m vmsif.m viota.m vid.v vpopc.m vfirst.m vdivu.vv vdiv.vv vremu.vv
syntax keyword riscvInstruction vrem.vv vmulhu.vv vmul.vv vmulhsu.vv vmulh.vv vmadd.vv vnmsub.vv vmacc.vv
syntax keyword riscvInstruction vnmsac.vv vwaddu.vv vwadd.vv vwsubu.vv vwsub.vv vwaddu.wv vwadd.wv vwsubu.wv
syntax keyword riscvInstruction vwsub.wv vwmulu.vv vwmulsu.vv vwmul.vv vwmaccu.vv vwmacc.vv vwmaccsu.vv
syntax keyword riscvInstruction vaaddu.vx vaadd.vx vasubu.vx vasub.vx vmv.s.x vslide1up.vx vslide1down.vx
syntax keyword riscvInstruction vdivu.vx vdiv.vx vremu.vx vrem.vx vmulhu.vx vmul.vx vmulhsu.vx vmulh.vx
syntax keyword riscvInstruction vmadd.vx vnmsub.vx vmacc.vx vnmsac.vx vwaddu.vx vwadd.vx vwsubu.vx vwsub.vx
syntax keyword riscvInstruction vwaddu.wx vwadd.wx vwsubu.wx vwsub.wx vwmulu.vx vwmulsu.vx vwmul.vx vwmaccu.vx
syntax keyword riscvInstruction vwmacc.vx vwmaccus.vx vwmaccsu.vx vamoswapei8.v vamoaddei8.v vamoxorei8.v
syntax keyword riscvInstruction vamoandei8.v vamoorei8.v vamominei8.v vamomaxei8.v vamominuei8.v vamomaxuei8.v
syntax keyword riscvInstruction vamoswapei16.v vamoaddei16.v vamoxorei16.v vamoandei16.v vamoorei16.v
syntax keyword riscvInstruction vamominei16.v vamomaxei16.v vamominuei16.v vamomaxuei16.v vamoswapei32.v
syntax keyword riscvInstruction vamoaddei32.v vamoxorei32.v vamoandei32.v vamoorei32.v vamominei32.v
syntax keyword riscvInstruction vamomaxei32.v vamominuei32.v vamomaxuei32.v vamoswapei64.v vamoaddei64.v
syntax keyword riscvInstruction vamoxorei64.v vamoandei64.v vamoorei64.v vamominei64.v vamomaxei64.v
syntax keyword riscvInstruction vamominuei64.v vamomaxuei64.v

" RVV-PSEUDO
syntax keyword riscvInstruction @vmvnfr.v

" pseudo-instructions
syntax keyword riscvInstruction nop li la mv
syntax keyword riscvInstruction not neg negw
syntax match   riscvInstruction "sext\.w"
syntax keyword riscvInstruction seqz snez sltz sgtz
syntax keyword riscvInstruction beqz bnez blez bgtz bgt ble bgtu bleu bgez bltz
syntax keyword riscvInstruction j jr ret call

hi def link riscvComment        Comment
hi def link riscvTodo           Todo
hi def link riscvNumber         Number
hi def link riscvString         String
hi def link riscvChar           String
hi def link riscvRegister       Identifier
hi def link riscvLabel          Label
hi def link riscvDirective      Type
hi def link riscvInstruction    Statement

let b:current_syntax = "riscv"
