import LiveScripts.Shared
import LiveScripts.S_d2dbff622e509dda256fedbd31ef6e9fd98ed49ad91d5c0e07f68af1.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_d2dbff622e509dda256fedbd31ef6e9fd98ed49ad91d5c0e07f68af1.script [ctx] 10000]
