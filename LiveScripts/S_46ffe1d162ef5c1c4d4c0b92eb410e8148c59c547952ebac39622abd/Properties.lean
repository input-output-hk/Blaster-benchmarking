import LiveScripts.Shared
import LiveScripts.S_46ffe1d162ef5c1c4d4c0b92eb410e8148c59c547952ebac39622abd.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_46ffe1d162ef5c1c4d4c0b92eb410e8148c59c547952ebac39622abd.script [ctx] 10000]
