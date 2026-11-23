import LiveScripts.Shared
import LiveScripts.S_46746c64151c3733e6de91585785841a2d53422d2ee94ec51a3bbcb4.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_46746c64151c3733e6de91585785841a2d53422d2ee94ec51a3bbcb4.script [ctx] 10000]
