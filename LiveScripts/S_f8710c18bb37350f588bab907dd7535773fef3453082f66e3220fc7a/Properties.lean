import LiveScripts.Shared
import LiveScripts.S_f8710c18bb37350f588bab907dd7535773fef3453082f66e3220fc7a.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_f8710c18bb37350f588bab907dd7535773fef3453082f66e3220fc7a.script [ctx] 10000]
